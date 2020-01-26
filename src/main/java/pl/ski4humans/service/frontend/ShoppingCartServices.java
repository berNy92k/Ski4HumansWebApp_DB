package pl.ski4humans.service.frontend;

import pl.ski4humans.controller.frontend.shoppingCartAndPayment.model.OrderStatus;
import pl.ski4humans.controller.frontend.shoppingCartAndPayment.model.PaymentMethod;
import pl.ski4humans.controller.frontend.shoppingCartAndPayment.model.ShoppingCart;
import pl.ski4humans.controller.frontend.shoppingCartAndPayment.model.TransactionData;
import pl.ski4humans.dao.EquipmentDAO;
import pl.ski4humans.dao.OrderDAO;
import pl.ski4humans.entity.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

public class ShoppingCartServices {
    private HttpServletRequest request;
    private HttpServletResponse response;
    private EquipmentDAO equipmentDAO;
    private OrderDAO orderDAO;

    public ShoppingCartServices(HttpServletRequest req, HttpServletResponse resp) {
        this.request = req;
        this.response = resp;
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ski4HumansWebApp");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        equipmentDAO = new EquipmentDAO(entityManager);
        orderDAO = new OrderDAO(entityManager);
    }

    public void viewShoppingCart() throws ServletException, IOException {
        Object shoppingCart = request.getSession().getAttribute("cart");

        if (shoppingCart == null) {
            shoppingCart = new ShoppingCart();
            request.getSession().setAttribute("cart", shoppingCart);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.SHOPPING_CART_HOMEPAGE_URL);
        requestDispatcher.forward(request, response);
    }

    public void addToShoppingCart() throws ServletException, IOException {
        Integer equipmentId = Integer.valueOf(request.getParameter("eq"));

        ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");

        if (shoppingCart == null) {
            shoppingCart = new ShoppingCart();
            request.getSession().setAttribute("cart", shoppingCart);
        }

        Equipment equipment = equipmentDAO.get(equipmentId);
        shoppingCart.addEquipment(equipment);

        request.setAttribute(ConstantsFrontendPL.MESSAGE, ConstantsFrontendPL.SHOPPING_CART_EQUIPMENT_WAS_ADDED);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.SHOPPING_CART_HOMEPAGE_URL);
        requestDispatcher.forward(request, response);
    }

    public void deleteFromShoppingCart() throws ServletException, IOException {
        Integer equipmentId = Integer.valueOf(request.getParameter("eq"));

        ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");

        Equipment equipment = equipmentDAO.get(equipmentId);
        shoppingCart.removeEquipmentByEquipment(equipment);

        request.setAttribute(ConstantsFrontendPL.MESSAGE, ConstantsFrontendPL.SHOPPING_CART_EQUIPMENT_WAS_DELETED);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.SHOPPING_CART_HOMEPAGE_URL);
        requestDispatcher.forward(request, response);
    }

    public void updateEquipmentInShoppingCart() throws ServletException, IOException {
        ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");

        Map<Integer, Integer> idEqAndQuantity = new HashMap<>();
        for (int i = 1; i <= shoppingCart.getTotalQuantityOfEquipments(); i++) {
            Integer eqId = Integer.valueOf(request.getParameter("eqId" + i));
            Integer quantity = Integer.valueOf(request.getParameter("quantity" + i));
            idEqAndQuantity.put(eqId, quantity);
        }
        shoppingCart.updateShoppingCart(idEqAndQuantity);

        request.setAttribute(ConstantsFrontendPL.MESSAGE, ConstantsFrontendPL.SHOPPING_CART_EQUIPMENT_WAS_UPDATED);

        viewShoppingCart();
    }

    public void clearShoppingCart() throws ServletException, IOException {
        ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");
        shoppingCart.clearShoppingCart();

        request.setAttribute(ConstantsFrontendPL.MESSAGE, ConstantsFrontendPL.SHOPPING_CART_EQUIPMENT_WAS_CLEARED);

        viewShoppingCart();
    }

    public void checkoutShoppingCart() throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer loggedCustomer = (Customer) session.getAttribute(ConstantsFrontendPL.LOGGED_CUSTOMER);

        if (loggedCustomer != null) {
            request.setAttribute("loggedCustomer", loggedCustomer);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.SHOPPING_CART_CHECKOUT_HOMEPAGE_URL);
            requestDispatcher.forward(request, response);
        } else {
            request.setAttribute(ConstantsFrontendPL.MESSAGE, ConstantsFrontendPL.SHOPPING_CART_CUSTOMER_NOT_LOGGED);
            viewShoppingCart();
        }
    }

    public void continueCheckoutShoppingCart() throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer loggedCustomer = (Customer) session.getAttribute(ConstantsFrontendPL.LOGGED_CUSTOMER);
        ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");
        ShippingAddress shippingAddress = fillShippingAddress();

        TransactionData transactionData = new TransactionData(
                shippingAddress,
                shoppingCart,
                loggedCustomer);

        session.setAttribute("transactionData", transactionData);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.SHOPPING_CART_FINAL_CHECKOUT_HOMEPAGE_URL);
        requestDispatcher.forward(request, response);
    }

    private ShippingAddress fillShippingAddress() {
        String email = request.getParameter("email");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String street = request.getParameter("street");
        String homeNumber = request.getParameter("homeNumber");
        String city = request.getParameter("city");
        String zipCode = request.getParameter("zipCode");
        String country = request.getParameter("country");
        String phone = request.getParameter("phone");

        ShippingAddress shippingAddress = new ShippingAddress();
        shippingAddress.setEmail(email);
        shippingAddress.setFirstName(firstName);
        shippingAddress.setLastName(lastName);
        shippingAddress.setStreetName(street);
        shippingAddress.setHouseOrApartmentNr(homeNumber);
        shippingAddress.setCity(city);
        shippingAddress.setZipCode(zipCode);
        shippingAddress.setCountry(country);
        shippingAddress.setPhone(phone);

        return shippingAddress;
    }

    public void payment() throws ServletException, IOException {
        HttpSession session = request.getSession();
        TransactionData transactionData = (TransactionData) session.getAttribute("transactionData");

        // get objects from Transaction Data
        Customer customer = transactionData.getCustomer();
        ShippingAddress shippingAddressToSaveInDB = transactionData.getShippingAddress();
        ShoppingCart shoppingCart = transactionData.getShoppingCart();

        // Save Order in DB
        Order orderToSaveInDB = new Order();
        orderToSaveInDB.setCustomer(customer);
        orderToSaveInDB.setShippingAddress(shippingAddressToSaveInDB);
        orderToSaveInDB.setPaymentMethod(PaymentMethod.CASH_ON_DELIVERY);
        orderToSaveInDB.setTotal(shoppingCart.getTotalAmount());
        orderToSaveInDB.setStatus(OrderStatus.ORDER_NEW);
        orderToSaveInDB.setOrderDate(new Date());

        // Add every single 'Order Equipment Details' to 'Order'
        Set<OrderEquipmentDetail> orderEquipmentDetails = new HashSet<>();
        for (Map.Entry<Equipment, Integer> singleOrderOfEquipmentWithQuantity : shoppingCart.getShoppingCart().entrySet()) {
            Equipment equipment = singleOrderOfEquipmentWithQuantity.getKey();
            Integer quantity = singleOrderOfEquipmentWithQuantity.getValue();
            float subTotalPrice = equipment.getPrice() * quantity;

            OrderEquipmentDetail orderEquipmentDetailToSaveInDB = new OrderEquipmentDetail();
            orderEquipmentDetailToSaveInDB.setEquipment(equipment);
            orderEquipmentDetailToSaveInDB.setQuantity(quantity);
            orderEquipmentDetailToSaveInDB.setSubtotal(subTotalPrice);
            orderEquipmentDetailToSaveInDB.setOrder(orderToSaveInDB);

            orderEquipmentDetails.add(orderEquipmentDetailToSaveInDB);
        }

        orderToSaveInDB.setOrderEquipmentDetails(orderEquipmentDetails);
        Order order = orderDAO.create(orderToSaveInDB);

        // return to page
        if (order.getOrderId() > 0) {
            session.removeAttribute("transactionData");
            session.removeAttribute("cart");

            request.setAttribute(ConstantsFrontendPL.MESSAGE, ConstantsFrontendPL.TRANSACTION_FINISHED_WITH_SUCCESFULL);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.PAYMENT_HOMEPAGE_URL);
            requestDispatcher.forward(request, response);
        } else {
            request.setAttribute(ConstantsFrontendPL.MESSAGE, ConstantsFrontendPL.TRANSACTION_FAILED);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.PAYMENT_HOMEPAGE_URL);
            requestDispatcher.forward(request, response);
        }
    }
}
