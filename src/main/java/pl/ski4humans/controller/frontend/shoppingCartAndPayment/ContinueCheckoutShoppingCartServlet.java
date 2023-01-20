package pl.ski4humans.controller.frontend.shoppingCartAndPayment;

import pl.ski4humans.service.frontend.ShoppingCartServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/homepage/continueCheckout")
public class ContinueCheckoutShoppingCartServlet extends HttpServlet {

  @Override
  protected void doGet(final HttpServletRequest req,
                       final HttpServletResponse resp) throws ServletException, IOException {

    doPost(req, resp);
  }

  @Override
  protected void doPost(final HttpServletRequest req,
                        final HttpServletResponse resp) throws ServletException, IOException {

    final ShoppingCartServices shoppingCartServices = new ShoppingCartServices(req, resp);
    shoppingCartServices.continueCheckoutShoppingCart();
  }
}
