package pl.ski4humans.controller.frontend.shoppingCartAndPayment;

import pl.ski4humans.service.frontend.ShoppingCartServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/homepage/updateEquipmentInShoppingCart")
public class UpdateShoppingCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        ShoppingCartServices shoppingCartServices = new ShoppingCartServices(req,resp);
        shoppingCartServices.updateEquipmentInShoppingCart();
    }
}
