package pl.ski4humans.service.admin;

import pl.ski4humans.dao.ManufacturerDAO;
import pl.ski4humans.entity.Manufacturer;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class ManufacturerServices {
    private ManufacturerDAO manufacturerDAO;
    private HttpServletRequest request;
    private HttpServletResponse response;

    public ManufacturerServices(HttpServletRequest req, HttpServletResponse resp) {
        this.request = req;
        this.response = resp;
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ski4HumansWebApp");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        manufacturerDAO = new ManufacturerDAO(entityManager);
    }

    public void manufacturerList()
            throws ServletException, IOException {
        manufacturerList(Constants.NULL);
    }

    public void manufacturerList(String message)
            throws ServletException, IOException {
        List<Manufacturer> manufacturers = manufacturerDAO.listAll();

        request.setAttribute("manufacturerList", manufacturers);
        if (message != null) {
            request.setAttribute("message", message);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(Constants.MANUFACTURER_LIST_URL);
        requestDispatcher.forward(request, response);
    }

    public void createManufacturer()
            throws ServletException, IOException {
        String manufacturerName = request.getParameter("manufacturerName");
        String description = request.getParameter("description");

        List<Manufacturer> manufacturers = manufacturerDAO.findByManufacturerName(manufacturerName);

        if (manufacturers.size() > 0) {
            manufacturerList(manufacturerName + Constants.MANUFACTURER_ALREADY_EXIST_IN_DB);
            return;
        }

        Manufacturer newManufacturer = new Manufacturer();
        newManufacturer.setManufacturerName(manufacturerName);
        newManufacturer.setDescription(description);

        // get Image
        Part imagePart = request.getPart("manufacturerImage");
        if (imagePart != null && imagePart.getSize() > 0) {
            long size = imagePart.getSize();
            byte[] imageBytes = new byte[(int) size];

            InputStream inputStream = imagePart.getInputStream();
            inputStream.read(imageBytes);
            inputStream.close();

            newManufacturer.setImage(imageBytes);
        }

        Manufacturer manufacturer = manufacturerDAO.create(newManufacturer);
        if (manufacturer.getManufacturerId() > 0) {
            manufacturerList(Constants.NEW_MANUFACTURER_WAS_CREATED);
        } else {
            manufacturerList(Constants.NEW_MANUFACTURER_WAS_NOT_CREATED);
        }
    }

    public void editManufacturer()
            throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        Manufacturer manufacturer = manufacturerDAO.get(id);

        if (manufacturer != null) {
            request.setAttribute("manufacturer", manufacturer);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(Constants.MANUFACTURER_CREATE_URL);
            requestDispatcher.forward(request, response);
        } else {
            manufacturerList(Constants.COULD_NOT_FIND_MANUFACTURER_BY_ID + id);
        }
    }

    public void updateManufacturer()
            throws ServletException, IOException {
        Integer manufacturerId = Integer.valueOf(request.getParameter("manufacturerId"));
        String manufacturerName = request.getParameter("manufacturerName");
        String description = request.getParameter("description");

        boolean isMoreEmailsInDatabase = false;

        Manufacturer userFoundById = manufacturerDAO.get(manufacturerId);

        List<Manufacturer> manufacturers = manufacturerDAO.findByManufacturerName(manufacturerName);
        Manufacturer userFoundByName = null;
        if (manufacturers.size() > 0 && manufacturers.size() < 2) {
            userFoundByName = manufacturers.get(0);
        } else if (manufacturers.size() > 1) {
            isMoreEmailsInDatabase = true;
        }

        if (isMoreEmailsInDatabase) {
            manufacturerList(Constants.MANUFACTURER_WAS_NOT_UPDATED + manufacturerName + Constants.MANUFACTURER_ALREADY_EXIST_IN_DB);
        } else if (userFoundByName != null && !userFoundByName.getManufacturerId().equals(userFoundById.getManufacturerId())) {
            manufacturerList(Constants.MANUFACTURER_WAS_NOT_UPDATED + manufacturerName + Constants.MANUFACTURER_ALREADY_EXIST_IN_DB);
        } else {
            Manufacturer manufacturer = new Manufacturer();
            manufacturer.setManufacturerId(manufacturerId);
            manufacturer.setManufacturerName(manufacturerName);
            manufacturer.setDescription(description);

            // get Image
            Part manufacturerImage = request.getPart("manufacturerImage");
            if (manufacturerImage != null && manufacturerImage.getSize() > 0) {
                long size = manufacturerImage.getSize();
                byte[] bytes = new byte[(int) size];

                InputStream inputStream = manufacturerImage.getInputStream();
                inputStream.read(bytes);
                inputStream.close();

                manufacturer.setImage(bytes);
            } else {
                manufacturer.setImage(userFoundById.getImage());
            }

            manufacturerDAO.update(manufacturer);
            manufacturerList(Constants.MANUFACTURER_WAS_UPDATED);
        }
    }

    public void deleteManufacturer()
            throws ServletException, IOException {
        Integer manufacturerId = Integer.valueOf(request.getParameter("id"));

        Manufacturer manufacturer = manufacturerDAO.get(manufacturerId);

        if (manufacturer != null) {
            manufacturerDAO.delete(manufacturerId);
            manufacturerList(Constants.MANUFACTURER_WAS_DELETED);
        } else {
            manufacturerList(Constants.COULD_NOT_FIND_MANUFACTURER_BY_ID + manufacturerId + Constants.DELETED_BY_ANOTHER_MANUFACTURER_ADMIN);
        }
    }
}
