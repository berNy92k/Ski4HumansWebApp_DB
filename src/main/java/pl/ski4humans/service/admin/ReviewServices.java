package pl.ski4humans.service.admin;

import pl.ski4humans.dao.CustomerDAO;
import pl.ski4humans.dao.EquipmentDAO;
import pl.ski4humans.dao.ReviewDAO;
import pl.ski4humans.entity.Customer;
import pl.ski4humans.entity.Equipment;
import pl.ski4humans.entity.Review;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

public class ReviewServices {
  private final ReviewDAO reviewDAO;
  private final EquipmentDAO equipmentDAO;
  private final CustomerDAO customerDAO;
  private final HttpServletRequest request;
  private final HttpServletResponse response;

  public ReviewServices(final HttpServletRequest req, final HttpServletResponse resp) {
    this.request = req;
    this.response = resp;
    EntityManager entityManager = Persistence
        .createEntityManagerFactory("Ski4HumansWebApp")
        .createEntityManager();
    reviewDAO = new ReviewDAO(entityManager);
    equipmentDAO = new EquipmentDAO(entityManager);
    customerDAO = new CustomerDAO(entityManager);
  }

  public void reviewList() throws ServletException, IOException {
    reviewList(ConstantsAdminPL.NULL);
  }

  public void reviewList(String message) throws ServletException, IOException {
    final List<Review> reviews = reviewDAO.listAll();

    request.setAttribute("reviewList", reviews);
    if (message != null) {
      request.setAttribute(ConstantsAdminPL.MESSAGE, message);
    }

    request
        .getRequestDispatcher(ConstantsAdminPL.Review.REVIEW_LIST_URL)
        .forward(request, response);
  }

  public void preCreateReview() throws ServletException, IOException {
    final List<Equipment> equipments = equipmentDAO.listAll();
    final List<Customer> customers = customerDAO.listAll();

    request.setAttribute("equipmentList", equipments);
    request.setAttribute("customerList", customers);

    request
        .getRequestDispatcher(ConstantsAdminPL.Review.REVIEW_CREATE_URL)
        .forward(request, response);
  }

  public void createReview() throws ServletException, IOException {
    final String headline = request.getParameter("headline");
    final Integer rating = Integer.valueOf(request.getParameter("rating"));
    final String comment = request.getParameter("comment");
    final Integer equipmentId = Integer.valueOf(request.getParameter("equipmentName"));
    final Integer customerId = Integer.valueOf(request.getParameter("customerName"));
    final Date createdDate = new Date();

    final Equipment equipment = equipmentDAO.get(equipmentId);
    final Customer customer = customerDAO.get(customerId);

    final Review newReview = Review.builder()
        .headline(headline)
        .rating(rating)
        .comment(comment)
        .equipment(equipment)
        .customer(customer)
        .reviewTime(createdDate)
        .build();

    reviewDAO.create(newReview);
    reviewList(ConstantsAdminPL.Review.NEW_REVIEW_WAS_CREATED);
  }

  public void editReview() throws ServletException, IOException {
    final Integer id = Integer.valueOf(request.getParameter("id"));
    final List<Equipment> equipments = equipmentDAO.listAll();
    final List<Customer> customers = customerDAO.listAll();

    final Review review = reviewDAO.get(id);
    if (review != null) {
      request.setAttribute("review", review);
      request.setAttribute("equipmentList", equipments);
      request.setAttribute("customerList", customers);

      request
          .getRequestDispatcher(ConstantsAdminPL.Review.REVIEW_CREATE_URL)
          .forward(request, response);
    } else {
      reviewList(ConstantsAdminPL.Review.COULD_NOT_FIND_REVIEW_BY_ID + id);
    }
  }

  public void updateReview() throws ServletException, IOException {
    final Integer reviewId = Integer.valueOf(request.getParameter("reviewId"));

    final Review reviewFoundById = reviewDAO.get(reviewId);
    if (reviewFoundById != null) {
      final String headline = request.getParameter("headline");
      final int rating = Integer.parseInt(request.getParameter("rating"));
      final String comment = request.getParameter("comment");
      final Integer equipmentId = Integer.valueOf(request.getParameter("equipmentName"));
      final Integer customerId = Integer.valueOf(request.getParameter("customerName"));

      final Equipment equipment = equipmentDAO.get(equipmentId);
      final Customer customer = customerDAO.get(customerId);

      reviewFoundById.setReviewId(reviewId);
      reviewFoundById.setHeadline(headline);
      reviewFoundById.setRating(rating);
      reviewFoundById.setComment(comment);
      reviewFoundById.setEquipment(equipment);
      reviewFoundById.setCustomer(customer);

      reviewDAO.update(reviewFoundById);
      reviewList(ConstantsAdminPL.Review.REVIEW_WAS_UPDATED);
    }
  }

  public void deleteReview() throws ServletException, IOException {
    final Integer reviewId = Integer.valueOf(request.getParameter("id"));

    final Review review = reviewDAO.get(reviewId);
    if (review != null) {
      reviewDAO.delete(reviewId);
      reviewList(ConstantsAdminPL.Review.REVIEW_WAS_DELETED);
    } else {
      reviewList(ConstantsAdminPL.Review.COULD_NOT_FIND_REVIEW_BY_ID
          + reviewId + ConstantsAdminPL.Review.DELETED_BY_ANOTHER_REVIEW_ADMIN);
    }
  }

  public void viewReview() throws ServletException, IOException {
    final Integer reviewId = Integer.valueOf(request.getParameter("id"));

    final Review review = reviewDAO.get(reviewId);
    if (review != null) {
      request.setAttribute("review", review);
    }

    request
        .getRequestDispatcher(ConstantsAdminPL.Review.REVIEW_VIEW_URL)
        .forward(request, response);
  }
}
