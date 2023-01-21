package pl.ski4humans.controller.admin;

import pl.ski4humans.service.admin.UserServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/logout")
public class AdminLogoutServlet extends HttpServlet {

  @Override
  protected void doGet(final HttpServletRequest req,
                       final HttpServletResponse resp) throws ServletException, IOException {
    final UserServices userServices = new UserServices(req, resp);
    userServices.logoutAsAdministrator();
  }
}
