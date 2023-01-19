package pl.ski4humans.controller.frontend;

import pl.ski4humans.service.frontend.EquipmentServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {

  @Override
  protected void doGet(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
    final EquipmentServices equipmentServices = new EquipmentServices(req, resp);
    equipmentServices.searchEquipmentList();
  }
}
