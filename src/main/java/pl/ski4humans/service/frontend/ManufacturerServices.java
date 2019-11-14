package pl.ski4humans.service.frontend;

import pl.ski4humans.dao.ManufacturerDAO;
import pl.ski4humans.entity.Manufacturer;
import pl.ski4humans.service.admin.ConstantsPL;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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
        List<Manufacturer> manufacturers = manufacturerDAO.listAll();

        request.setAttribute("manufacturerList", manufacturers);
        if (manufacturers != null && manufacturers.size() == 0) {
            request.setAttribute("message", ConstantsFrontendPL.LACK_OF_MANUFACTURER_IN_DB);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.MANUFACTURER_LIST_URL);
        requestDispatcher.forward(request, response);
    }
}
