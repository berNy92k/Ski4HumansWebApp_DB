package pl.ski4humans.controller.admin.review;

import pl.ski4humans.service.admin.ReviewServices;
import pl.ski4humans.service.admin.UserServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/reviews")
public class ListReviewServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ReviewServices reviewServices = new ReviewServices(req, resp);
        reviewServices.reviewList();
    }
}
