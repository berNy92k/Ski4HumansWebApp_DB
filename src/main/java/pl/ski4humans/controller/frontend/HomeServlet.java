package pl.ski4humans.controller.frontend;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String homepage = "/homepage/index.jsp";
        RequestDispatcher dispatcher = req.getRequestDispatcher(homepage);
        dispatcher.forward(req, resp);
    }
}
