package pl.ski4humans.service.frontend;

import pl.ski4humans.dao.ManufacturerDAO;
import pl.ski4humans.entity.Manufacturer;
import pl.ski4humans.service.admin.ConstantsPL;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ManufacturerServices {

  private final ManufacturerDAO manufacturerDAO;
  private final HttpServletRequest request;
  private final HttpServletResponse response;

  public ManufacturerServices(final HttpServletRequest req, final HttpServletResponse resp) {
    this.request = req;
    this.response = resp;
    EntityManager entityManager = Persistence
        .createEntityManagerFactory("Ski4HumansWebApp")
        .createEntityManager();
    manufacturerDAO = new ManufacturerDAO(entityManager);
  }

  public void manufacturerList() throws ServletException, IOException {
    final List<Manufacturer> manufacturers = manufacturerDAO.listAll();

    request.setAttribute("manufacturerList", manufacturers);
    if (manufacturers != null && manufacturers.size() == 0) {
      request.setAttribute(ConstantsPL.MESSAGE, ConstantsFrontendPL.Manufacturer.LACK_OF_MANUFACTURER_IN_DB);
    }

    request
        .getRequestDispatcher(ConstantsFrontendPL.Manufacturer.MANUFACTURER_LIST_URL)
        .forward(request, response);
  }
}
