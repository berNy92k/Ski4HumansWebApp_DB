package pl.ski4humans.controller.admin.customer;

import pl.ski4humans.service.admin.CustomerServices;
import pl.ski4humans.service.admin.EquipmentServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/viewCustomer")
public class ViewCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        CustomerServices customerServices = new CustomerServices(req, resp);
        customerServices.viewEquipment();
    }
}
