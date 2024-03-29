package pl.ski4humans.controller.admin.customer;

import pl.ski4humans.service.admin.CustomerServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/createNewCustomer")
public class CreateCustomerServlet extends HttpServlet {

  @Override
  protected void doPost(final HttpServletRequest req,
                        final HttpServletResponse resp) throws ServletException, IOException {

    final CustomerServices customerServices = new CustomerServices(req, resp);
    customerServices.createCustomer();
  }
}
