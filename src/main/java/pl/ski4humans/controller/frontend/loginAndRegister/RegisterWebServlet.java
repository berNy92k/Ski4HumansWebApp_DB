package pl.ski4humans.controller.frontend.loginAndRegister;

import pl.ski4humans.service.frontend.CustomerServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/homepage/register")
public class RegisterWebServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CustomerServices customerServices = new CustomerServices(req, resp);
        customerServices.registerFormCustomer();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CustomerServices customerServices = new CustomerServices(req, resp);
        customerServices.registerCustomer();
    }
}
