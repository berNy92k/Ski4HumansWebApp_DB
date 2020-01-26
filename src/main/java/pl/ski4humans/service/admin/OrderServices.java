package pl.ski4humans.service.admin;

import pl.ski4humans.dao.OrderDAO;
import pl.ski4humans.entity.Order;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class OrderServices {
    private OrderDAO orderDAO;
    private HttpServletRequest request;
    private HttpServletResponse response;

    public OrderServices(HttpServletRequest req, HttpServletResponse resp) {
        this.request = req;
        this.response = resp;
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ski4HumansWebApp");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        orderDAO = new OrderDAO(entityManager);
    }

    public void ordersList()
            throws ServletException, IOException {
        ordersList(ConstantsPL.NULL);
    }

    public void ordersList(String message)
            throws ServletException, IOException {

        List<Order> orders = orderDAO.listAll();

        request.setAttribute("orderList", orders);
        if (message != null) {
            request.setAttribute(ConstantsPL.MESSAGE, message);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsPL.ORDER_LIST_URL);
        requestDispatcher.forward(request, response);
    }

    public void editOrder()
            throws ServletException, IOException {

    }

    public void updateOrder()
            throws ServletException, IOException {

    }

    public void deleteOrder()
            throws ServletException, IOException {
        Integer orderId = Integer.valueOf(request.getParameter("id"));

        Order order = orderDAO.get(orderId);

        if (order != null) {
            orderDAO.delete(orderId);
            ordersList(ConstantsPL.ORDER_WAS_DELETED);
        } else {
            ordersList(ConstantsPL.COULD_NOT_FIND_ORDER_BY_ID + orderId + ConstantsPL.DELETED_BY_ANOTHER_ORDER_ADMIN);
        }
    }

    public void viewOrder()
            throws ServletException, IOException {
        Integer orderId = Integer.valueOf(request.getParameter("id"));

        Order order = orderDAO.get(orderId);
        if (order != null) {
            request.setAttribute("order", order);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsPL.ORDER_VIEW_URL);
        requestDispatcher.forward(request, response);
    }
}
