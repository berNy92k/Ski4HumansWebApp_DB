package pl.ski4humans.service.admin;

import pl.ski4humans.dao.OrderDAO;
import pl.ski4humans.entity.Order;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class OrderServices {

  private final OrderDAO orderDAO;
  private final HttpServletRequest request;
  private final HttpServletResponse response;

  public OrderServices(final HttpServletRequest req, final HttpServletResponse resp) {
    this.request = req;
    this.response = resp;
    EntityManager entityManager = Persistence
        .createEntityManagerFactory("Ski4HumansWebApp")
        .createEntityManager();
    orderDAO = new OrderDAO(entityManager);
  }

  public void ordersList() throws ServletException, IOException {
    ordersList(ConstantsAdminPL.NULL);
  }

  public void ordersList(final String message) throws ServletException, IOException {

    final List<Order> orders = orderDAO.listAll();

    request.setAttribute("orderList", orders);
    if (message != null) {
      request.setAttribute(ConstantsAdminPL.MESSAGE, message);
    }

    request
        .getRequestDispatcher(ConstantsAdminPL.Order.ORDER_LIST_URL)
        .forward(request, response);
  }

  public void editOrder() throws ServletException, IOException {
// TODO
  }

  public void updateOrder() throws ServletException, IOException {
// TODO
  }

  public void deleteOrder() throws ServletException, IOException {
    final Integer orderId = Integer.valueOf(request.getParameter("id"));
    final Order order = orderDAO.get(orderId);

    if (order != null) {
      orderDAO.delete(orderId);
      ordersList(ConstantsAdminPL.Order.ORDER_WAS_DELETED);
    } else {
      ordersList(ConstantsAdminPL.Order.COULD_NOT_FIND_ORDER_BY_ID
          + orderId + ConstantsAdminPL.Order.DELETED_BY_ANOTHER_ORDER_ADMIN);
    }
  }

  public void viewOrder() throws ServletException, IOException {
    final Integer orderId = Integer.valueOf(request.getParameter("id"));

    final Order order = orderDAO.get(orderId);
    if (order != null) {
      request.setAttribute("order", order);
    }

    request
        .getRequestDispatcher(ConstantsAdminPL.Order.ORDER_VIEW_URL)
        .forward(request, response);
  }
}
