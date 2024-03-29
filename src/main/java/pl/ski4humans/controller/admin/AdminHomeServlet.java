package pl.ski4humans.controller.admin;

import pl.ski4humans.service.admin.ConstantsAdminPL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/")
public class AdminHomeServlet extends HttpServlet {

  @Override
  protected void doPost(final HttpServletRequest req,
                        final HttpServletResponse resp) throws ServletException, IOException {

    doGet(req, resp);
  }

  protected void doGet(final HttpServletRequest req,
                       final HttpServletResponse resp) throws ServletException, IOException {

    final RequestDispatcher dispatcher = req.getRequestDispatcher(ConstantsAdminPL.User.ADMIN_HOMEPAGE_URL_JSP);
    dispatcher.forward(req, resp);
  }
}
