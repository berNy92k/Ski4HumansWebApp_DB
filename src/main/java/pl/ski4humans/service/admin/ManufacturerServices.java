package pl.ski4humans.service.admin;

import pl.ski4humans.dao.ManufacturerDAO;
import pl.ski4humans.entity.Manufacturer;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
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
    manufacturerList(ConstantsAdminPL.NULL);
  }

  public void manufacturerList(String message) throws ServletException, IOException {
    final List<Manufacturer> manufacturers = manufacturerDAO.listAll();

    request.setAttribute("manufacturerList", manufacturers);
    if (message != null) {
      request.setAttribute(ConstantsAdminPL.MESSAGE, message);
    }

    request
        .getRequestDispatcher(ConstantsAdminPL.Manufacturer.MANUFACTURER_LIST_URL)
        .forward(request, response);
  }

  public void createManufacturer() throws ServletException, IOException {
    final String manufacturerName = request.getParameter("manufacturerName");
    final String description = request.getParameter("description");

    final List<Manufacturer> manufacturers = manufacturerDAO.findByManufacturerName(manufacturerName);

    if (manufacturers.size() > 0) {
      manufacturerList(manufacturerName + ConstantsAdminPL.Manufacturer.MANUFACTURER_ALREADY_EXIST_IN_DB);
      return;
    }

    final Manufacturer newManufacturer = Manufacturer.builder()
        .manufacturerName(manufacturerName)
        .description(description)
        .build();

    // get Image
    final Part imagePart = request.getPart("manufacturerImage");
    if (imagePart != null && imagePart.getSize() > 0) {
      final long size = imagePart.getSize();
      final byte[] imageBytes = new byte[(int) size];

      final InputStream inputStream = imagePart.getInputStream();
      inputStream.read(imageBytes);
      inputStream.close();

      newManufacturer.setImage(imageBytes);
    }

    final Manufacturer manufacturer = manufacturerDAO.create(newManufacturer);
    if (manufacturer.getManufacturerId() > 0) {
      manufacturerList(ConstantsAdminPL.Manufacturer.NEW_MANUFACTURER_WAS_CREATED);
    } else {
      manufacturerList(ConstantsAdminPL.Manufacturer.NEW_MANUFACTURER_WAS_NOT_CREATED);
    }
  }

  public void editManufacturer() throws ServletException, IOException {
    final Integer id = Integer.valueOf(request.getParameter("id"));
    final Manufacturer manufacturer = manufacturerDAO.get(id);

    if (manufacturer != null) {
      request.setAttribute("manufacturer", manufacturer);

      request
          .getRequestDispatcher(ConstantsAdminPL.Manufacturer.MANUFACTURER_CREATE_URL)
          .forward(request, response);
    } else {
      manufacturerList(ConstantsAdminPL.Manufacturer.COULD_NOT_FIND_MANUFACTURER_BY_ID + id);
    }
  }

  public void updateManufacturer() throws ServletException, IOException {
    final Integer manufacturerId = Integer.valueOf(request.getParameter("manufacturerId"));
    final String manufacturerName = request.getParameter("manufacturerName");
    final String description = request.getParameter("description");

    boolean isMoreEmailsInDatabase = false;

    final Manufacturer userFoundById = manufacturerDAO.get(manufacturerId);

    final List<Manufacturer> manufacturers = manufacturerDAO.findByManufacturerName(manufacturerName);
    Manufacturer userFoundByName = null;
    if (manufacturers.size() > 0 && manufacturers.size() < 2) {
      userFoundByName = manufacturers.get(0);
    } else if (manufacturers.size() > 1) {
      isMoreEmailsInDatabase = true;
    }

    if (isMoreEmailsInDatabase) {

      manufacturerList(ConstantsAdminPL.Manufacturer.MANUFACTURER_WAS_NOT_UPDATED
          + manufacturerName + ConstantsAdminPL.Manufacturer.MANUFACTURER_ALREADY_EXIST_IN_DB);
    } else if (userFoundByName != null
        && !userFoundByName.getManufacturerId().equals(userFoundById.getManufacturerId())) {

      manufacturerList(ConstantsAdminPL.Manufacturer.MANUFACTURER_WAS_NOT_UPDATED
          + manufacturerName + ConstantsAdminPL.Manufacturer.MANUFACTURER_ALREADY_EXIST_IN_DB);
    } else {

      final Manufacturer manufacturer = Manufacturer.builder()
          .manufacturerId(manufacturerId)
          .manufacturerName(manufacturerName)
          .description(description)
          .build();

      // get Image
      final Part manufacturerImage = request.getPart("manufacturerImage");
      if (manufacturerImage != null && manufacturerImage.getSize() > 0) {
        final long size = manufacturerImage.getSize();
        final byte[] bytes = new byte[(int) size];

        final InputStream inputStream = manufacturerImage.getInputStream();
        inputStream.read(bytes);
        inputStream.close();

        manufacturer.setImage(bytes);
      } else {
        manufacturer.setImage(userFoundById.getImage());
      }

      manufacturerDAO.update(manufacturer);
      manufacturerList(ConstantsAdminPL.Manufacturer.MANUFACTURER_WAS_UPDATED);
    }
  }

  public void deleteManufacturer() throws ServletException, IOException {
    final Integer manufacturerId = Integer.valueOf(request.getParameter("id"));
    final Manufacturer manufacturer = manufacturerDAO.get(manufacturerId);

    if (manufacturer != null) {
      manufacturerDAO.delete(manufacturerId);
      manufacturerList(ConstantsAdminPL.Manufacturer.MANUFACTURER_WAS_DELETED);
    } else {
      manufacturerList(ConstantsAdminPL.Manufacturer.COULD_NOT_FIND_MANUFACTURER_BY_ID
          + manufacturerId + ConstantsAdminPL.Manufacturer.DELETED_BY_ANOTHER_MANUFACTURER_ADMIN);
    }
  }
}
