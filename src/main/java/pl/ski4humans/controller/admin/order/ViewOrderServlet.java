package pl.ski4humans.controller.admin.order;

import pl.ski4humans.service.admin.OrderServices;
import pl.ski4humans.service.admin.ReviewServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/viewOrder")
public class ViewOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        OrderServices orderServices = new OrderServices(req, resp);
        orderServices.viewOrder();
    }
}
