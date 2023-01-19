package pl.ski4humans.service.frontend;

import pl.ski4humans.controller.frontend.shoppingCartAndPayment.model.OrderStatus;
import pl.ski4humans.controller.frontend.shoppingCartAndPayment.model.PaymentMethod;
import pl.ski4humans.controller.frontend.shoppingCartAndPayment.model.ShoppingCart;
import pl.ski4humans.controller.frontend.shoppingCartAndPayment.model.TransactionData;
import pl.ski4humans.dao.EquipmentDAO;
import pl.ski4humans.dao.OrderDAO;
import pl.ski4humans.entity.Customer;
import pl.ski4humans.entity.Equipment;
import pl.ski4humans.entity.Order;
import pl.ski4humans.entity.OrderEquipmentDetail;
import pl.ski4humans.entity.ShippingAddress;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

public class ShoppingCartServices {

  private final HttpServletRequest request;
  private final HttpServletResponse response;
  private final EquipmentDAO equipmentDAO;
  private final OrderDAO orderDAO;

  public ShoppingCartServices(final HttpServletRequest req, final HttpServletResponse resp) {
    this.request = req;
    this.response = resp;
    EntityManager entityManager = Persistence
        .createEntityManagerFactory("Ski4HumansWebApp")
        .createEntityManager();
    equipmentDAO = new EquipmentDAO(entityManager);
    orderDAO = new OrderDAO(entityManager);
  }

  public void viewShoppingCart() throws ServletException, IOException {
    Object shoppingCart = request.getSession().getAttribute("cart");

    if (shoppingCart == null) {
      shoppingCart = new ShoppingCart();
      request.getSession().setAttribute("cart", shoppingCart);
    }

    request
        .getRequestDispatcher(ConstantsFrontendPL.ShoppingCart.SHOPPING_CART_HOMEPAGE_URL)
        .forward(request, response);
  }

  public void addToShoppingCart() throws ServletException, IOException {
    final Integer equipmentId = Integer.valueOf(request.getParameter("eq"));
    ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");

    if (shoppingCart == null) {
      shoppingCart = new ShoppingCart();
      request.getSession().setAttribute("cart", shoppingCart);
    }

    final Equipment equipment = equipmentDAO.get(equipmentId);
    shoppingCart.addEquipment(equipment);

    request.setAttribute(ConstantsFrontendPL.MESSAGE, ConstantsFrontendPL.ShoppingCart.SHOPPING_CART_EQUIPMENT_WAS_ADDED);

    request
        .getRequestDispatcher(ConstantsFrontendPL.ShoppingCart.SHOPPING_CART_HOMEPAGE_URL)
        .forward(request, response);
  }

  public void deleteFromShoppingCart() throws ServletException, IOException {
    final Integer equipmentId = Integer.valueOf(request.getParameter("eq"));
    ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");

    final Equipment equipment = equipmentDAO.get(equipmentId);
    shoppingCart.removeEquipmentByEquipment(equipment);

    request.setAttribute(ConstantsFrontendPL.MESSAGE, ConstantsFrontendPL.ShoppingCart.SHOPPING_CART_EQUIPMENT_WAS_DELETED);

    request
        .getRequestDispatcher(ConstantsFrontendPL.ShoppingCart.SHOPPING_CART_HOMEPAGE_URL)
        .forward(request, response);
  }

  public void updateEquipmentInShoppingCart() throws ServletException, IOException {
    final ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");

    final Map<Integer, Integer> idEqAndQuantity = new HashMap<>();
    for (int i = 1; i <= shoppingCart.getTotalQuantityOfEquipments(); i++) {
      final Integer eqId = Integer.valueOf(request.getParameter("eqId" + i));
      final Integer quantity = Integer.valueOf(request.getParameter("quantity" + i));
      idEqAndQuantity.put(eqId, quantity);
    }
    shoppingCart.updateShoppingCart(idEqAndQuantity);

    request.setAttribute(ConstantsFrontendPL.MESSAGE, ConstantsFrontendPL.ShoppingCart.SHOPPING_CART_EQUIPMENT_WAS_UPDATED);

    viewShoppingCart();
  }

  public void clearShoppingCart() throws ServletException, IOException {
    final ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");
    shoppingCart.clearShoppingCart();

    request.setAttribute(ConstantsFrontendPL.MESSAGE, ConstantsFrontendPL.ShoppingCart.SHOPPING_CART_EQUIPMENT_WAS_CLEARED);

    viewShoppingCart();
  }

  public void checkoutShoppingCart() throws ServletException, IOException {
    final Customer loggedCustomer = (Customer) request.getSession().getAttribute(ConstantsFrontendPL.LoginRegister.LOGGED_CUSTOMER);

    if (loggedCustomer != null) {
      request.setAttribute("loggedCustomer", loggedCustomer);

      request
          .getRequestDispatcher(ConstantsFrontendPL.ShoppingCart.SHOPPING_CART_CHECKOUT_HOMEPAGE_URL)
          .forward(request, response);
    } else {
      request.setAttribute(ConstantsFrontendPL.MESSAGE, ConstantsFrontendPL.ShoppingCart.SHOPPING_CART_CUSTOMER_NOT_LOGGED);
      viewShoppingCart();
    }
  }

  public void continueCheckoutShoppingCart() throws ServletException, IOException {
    final HttpSession session = request.getSession();
    final Customer loggedCustomer = (Customer) session.getAttribute(ConstantsFrontendPL.LoginRegister.LOGGED_CUSTOMER);
    final ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");
    final ShippingAddress shippingAddress = fillShippingAddress();

    final TransactionData transactionData = new TransactionData(
        shippingAddress,
        shoppingCart,
        loggedCustomer);

    session.setAttribute("transactionData", transactionData);

    request
        .getRequestDispatcher(ConstantsFrontendPL.ShoppingCart.SHOPPING_CART_FINAL_CHECKOUT_HOMEPAGE_URL)
        .forward(request, response);
  }

  private ShippingAddress fillShippingAddress() {
    final String email = request.getParameter("email");
    final String firstName = request.getParameter("firstName");
    final String lastName = request.getParameter("lastName");
    final String street = request.getParameter("street");
    final String homeNumber = request.getParameter("homeNumber");
    final String city = request.getParameter("city");
    final String zipCode = request.getParameter("zipCode");
    final String country = request.getParameter("country");
    final String phone = request.getParameter("phone");

    return ShippingAddress.builder()
        .email(email)
        .firstName(firstName)
        .lastName(lastName)
        .streetName(street)
        .houseOrApartmentNr(homeNumber)
        .city(city)
        .zipCode(zipCode)
        .country(country)
        .phone(phone)
        .build();
  }

  public void payment() throws ServletException, IOException {
    final HttpSession session = request.getSession();
    final TransactionData transactionData = (TransactionData) session.getAttribute("transactionData");

    // get objects from Transaction Data
    final Customer customer = transactionData.getCustomer();
    final ShippingAddress shippingAddressToSaveInDB = transactionData.getShippingAddress();
    final ShoppingCart shoppingCart = transactionData.getShoppingCart();

    // Save Order in DB
    final Order orderToSaveInDB = Order.builder()
        .customer(customer)
        .shippingAddress(shippingAddressToSaveInDB)
        .total(shoppingCart.getTotalAmount())
        .orderDate(new Date())
        .build();
    orderToSaveInDB.setPaymentMethod(PaymentMethod.CASH_ON_DELIVERY);
    orderToSaveInDB.setStatus(OrderStatus.ORDER_NEW);

    // Add every single 'Order Equipment Details' to 'Order'
    final Set<OrderEquipmentDetail> orderEquipmentDetails = new HashSet<>();
    for (final Map.Entry<Equipment, Integer> singleOrderOfEquipmentWithQuantity : shoppingCart.getShoppingCart().entrySet()) {
      final Equipment equipment = singleOrderOfEquipmentWithQuantity.getKey();
      final Integer quantity = singleOrderOfEquipmentWithQuantity.getValue();

      orderEquipmentDetails.add(
          OrderEquipmentDetail.builder()
              .equipment(equipment)
              .quantity(quantity)
              .subtotal(equipment.getPrice() * quantity)
              .order(orderToSaveInDB)
              .build()
      );
    }

    orderToSaveInDB.setOrderEquipmentDetails(orderEquipmentDetails);
    final Order order = orderDAO.create(orderToSaveInDB);

    // return to page
    if (order.getOrderId() > 0) {
      session.removeAttribute("transactionData");
      session.removeAttribute("cart");

      request.setAttribute(ConstantsFrontendPL.MESSAGE, ConstantsFrontendPL.ShoppingCart.TRANSACTION_FINISHED_WITH_SUCCESFULL);
    } else {
      request.setAttribute(ConstantsFrontendPL.MESSAGE, ConstantsFrontendPL.ShoppingCart.TRANSACTION_FAILED);
    }

    request
        .getRequestDispatcher(ConstantsFrontendPL.ShoppingCart.PAYMENT_HOMEPAGE_URL)
        .forward(request, response);
  }
}
