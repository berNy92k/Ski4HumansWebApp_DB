package pl.ski4humans.controller.admin.review;

import pl.ski4humans.service.admin.ReviewServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/deleteReview")
public class DeleteReviewServlet extends HttpServlet {

  @Override
  protected void doGet(final HttpServletRequest req,
                       final HttpServletResponse resp) throws ServletException, IOException {

    final ReviewServices reviewServices = new ReviewServices(req, resp);
    reviewServices.deleteReview();
  }
}
