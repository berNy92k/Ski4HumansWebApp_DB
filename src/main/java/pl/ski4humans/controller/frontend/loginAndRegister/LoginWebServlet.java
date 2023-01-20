package pl.ski4humans.controller.frontend.loginAndRegister;

import pl.ski4humans.service.frontend.CustomerServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/homepage/login")
public class LoginWebServlet extends HttpServlet {

  @Override
  protected void doGet(final HttpServletRequest req,
                       final HttpServletResponse resp) throws ServletException, IOException {

    final CustomerServices customerServices = new CustomerServices(req, resp);
    customerServices.loginFormCustomer();
  }

  @Override
  protected void doPost(final HttpServletRequest req,
                        final HttpServletResponse resp) throws ServletException, IOException {

    final CustomerServices customerServices = new CustomerServices(req, resp);
    customerServices.loginAsCustomer();
  }
}
