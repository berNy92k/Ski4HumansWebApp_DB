package pl.ski4humans.service.frontend;

import pl.ski4humans.dao.CustomerDAO;
import pl.ski4humans.dao.EquipmentDAO;
import pl.ski4humans.dao.ReviewDAO;
import pl.ski4humans.entity.Customer;
import pl.ski4humans.entity.Equipment;
import pl.ski4humans.entity.Review;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

public class ReviewServices {
    private ReviewDAO reviewDAO;
    private EquipmentDAO equipmentDAO;
    private CustomerDAO customerDAO;
    private HttpServletRequest request;
    private HttpServletResponse response;

    public ReviewServices(HttpServletRequest req, HttpServletResponse resp) {
        this.request = req;
        this.response = resp;
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ski4HumansWebApp");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        reviewDAO = new ReviewDAO(entityManager);
        equipmentDAO = new EquipmentDAO(entityManager);
        customerDAO = new CustomerDAO(entityManager);
    }

    public void preCreateReview() throws ServletException, IOException {
        Integer equipmentId = Integer.valueOf(request.getParameter("eqId"));
        Equipment equipment = equipmentDAO.get(equipmentId);

        request.setAttribute("equipment", equipment);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.REVIEW_HOMEPAGE_CREATE_URL);
        requestDispatcher.forward(request, response);
    }

    public void createReview() throws ServletException, IOException {
        String headline = request.getParameter("headline");
        Integer rating = Integer.valueOf(request.getParameter("rating"));
        String comment = request.getParameter("comment");
        Integer equipmentId = Integer.valueOf(request.getParameter("equipmentId"));
        Integer customerId = Integer.valueOf(request.getParameter("customerId"));
        Date createdDate = new Date();

        Equipment equipment = equipmentDAO.get(equipmentId);
        Customer customer = customerDAO.get(customerId);

        Review newReview = new Review();
        newReview.setHeadline(headline);
        newReview.setRating(rating);
        newReview.setComment(comment);
        newReview.setEquipment(equipment);
        newReview.setCustomer(customer);
        newReview.setReviewTime(createdDate);
        reviewDAO.create(newReview);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("../viewEquipment?id=" + equipmentId);
        requestDispatcher.forward(request, response);
    }
}
