package pl.ski4humans.service.admin;

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
import java.util.List;

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

    public void reviewList() throws ServletException, IOException {
        reviewList(ConstantsPL.NULL);
    }

    public void reviewList(String message) throws ServletException, IOException {
        List<Review> reviews = reviewDAO.listAll();

        request.setAttribute("reviewList", reviews);
        if (message != null) {
            request.setAttribute(ConstantsPL.MESSAGE, message);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsPL.REVIEW_LIST_URL);
        requestDispatcher.forward(request, response);
    }

    public void preCreateReview() throws ServletException, IOException {
        List<Equipment> equipments = equipmentDAO.listAll();
        List<Customer> customers = customerDAO.listAll();

        request.setAttribute("equipmentList", equipments);
        request.setAttribute("customerList", customers);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsPL.REVIEW_CREATE_URL);
        requestDispatcher.forward(request, response);
    }

    public void createReview() throws ServletException, IOException {
        String headline = request.getParameter("headline");
        Integer rating = Integer.valueOf(request.getParameter("rating"));
        String comment = request.getParameter("comment");
        Integer equipmentId = Integer.valueOf(request.getParameter("equipmentName"));
        Integer customerId = Integer.valueOf(request.getParameter("customerName"));
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
        reviewList(ConstantsPL.NEW_REVIEW_WAS_CREATED);
    }

    public void editReview() throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        List<Equipment> equipments = equipmentDAO.listAll();
        List<Customer> customers = customerDAO.listAll();

        Review review = reviewDAO.get(id);
        if (review != null) {
            request.setAttribute("review", review);
            request.setAttribute("equipmentList", equipments);
            request.setAttribute("customerList", customers);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsPL.REVIEW_CREATE_URL);
            requestDispatcher.forward(request, response);
        } else {
            reviewList(ConstantsPL.COULD_NOT_FIND_REVIEW_BY_ID + id);
        }
    }

    public void updateReview() throws ServletException, IOException {
        Integer reviewId = Integer.valueOf(request.getParameter("reviewId"));
        String headline = request.getParameter("headline");
        Integer rating = Integer.valueOf(request.getParameter("rating"));
        String comment = request.getParameter("comment");
        Integer equipmentId = Integer.valueOf(request.getParameter("equipmentName"));
        Integer customerId = Integer.valueOf(request.getParameter("customerName"));

        Review reviewFoundById = reviewDAO.get(reviewId);
        if (reviewFoundById != null){
            Equipment equipment = equipmentDAO.get(equipmentId);
            Customer customer = customerDAO.get(customerId);

            reviewFoundById.setReviewId(reviewId);
            reviewFoundById.setHeadline(headline);
            reviewFoundById.setRating(rating);
            reviewFoundById.setComment(comment);
            reviewFoundById.setEquipment(equipment);
            reviewFoundById.setCustomer(customer);

            reviewDAO.update(reviewFoundById);

            reviewList(ConstantsPL.REVIEW_WAS_UPDATED);
        }
    }

    public void deleteReview() throws ServletException, IOException {
        Integer reviewId = Integer.valueOf(request.getParameter("id"));

        Review review = reviewDAO.get(reviewId);
        if (review != null) {
            reviewDAO.delete(reviewId);
            reviewList(ConstantsPL.REVIEW_WAS_DELETED);
        } else {
            reviewList(ConstantsPL.COULD_NOT_FIND_REVIEW_BY_ID + reviewId + ConstantsPL.DELETED_BY_ANOTHER_REVIEW_ADMIN);
        }
    }

    public void viewReview() throws ServletException, IOException {
        Integer reviewId = Integer.valueOf(request.getParameter("id"));

        Review review = reviewDAO.get(reviewId);
        if (review != null) {
            request.setAttribute("review", review);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsPL.REVIEW_VIEW_URL);
        requestDispatcher.forward(request, response);
    }
}
