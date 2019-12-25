package pl.ski4humans.service.frontend;

import pl.ski4humans.controller.frontend.shoppingCart.model.ShoppingCart;
import pl.ski4humans.dao.EquipmentDAO;
import pl.ski4humans.entity.Equipment;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class ShoppingCartServices {
    private HttpServletRequest request;
    private HttpServletResponse response;
    private EquipmentDAO equipmentDAO;

    public ShoppingCartServices(HttpServletRequest req, HttpServletResponse resp) {
        this.request = req;
        this.response = resp;
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ski4HumansWebApp");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        equipmentDAO = new EquipmentDAO(entityManager);
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

    // TODO - in progress
    public void checkoutShoppingCart() {
        // continue
    }
}
