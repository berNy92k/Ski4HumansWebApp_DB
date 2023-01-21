package pl.ski4humans.controller.admin.order;

import pl.ski4humans.service.admin.OrderServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/deleteOrder")
public class DeleteOrderServlet extends HttpServlet {

  @Override
  protected void doGet(final HttpServletRequest req,
                       final HttpServletResponse resp) throws ServletException, IOException {

    final OrderServices orderServices = new OrderServices(req, resp);
    orderServices.deleteOrder();
  }
}
