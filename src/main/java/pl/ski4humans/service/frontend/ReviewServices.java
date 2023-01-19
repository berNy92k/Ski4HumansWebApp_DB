package pl.ski4humans.service.frontend;

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

  public void preCreateReview() throws ServletException, IOException {
    final Integer equipmentId = Integer.valueOf(request.getParameter("eqId"));
    final Equipment equipment = equipmentDAO.get(equipmentId);

    request.setAttribute("equipment", equipment);

    request
        .getRequestDispatcher(ConstantsFrontendPL.Review.REVIEW_HOMEPAGE_CREATE_URL)
        .forward(request, response);
  }

  public void createReview() throws ServletException, IOException {
    final String headline = request.getParameter("headline");
    final int rating = Integer.parseInt(request.getParameter("rating"));
    final String comment = request.getParameter("comment");
    final Integer equipmentId = Integer.valueOf(request.getParameter("equipmentId"));
    final Integer customerId = Integer.valueOf(request.getParameter("customerId"));
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

    request
        .getRequestDispatcher("../viewEquipment?id=" + equipmentId)
        .forward(request, response);
  }
}
