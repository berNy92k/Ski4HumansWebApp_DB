package pl.ski4humans.controller.frontend.review;


import pl.ski4humans.service.frontend.ReviewServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/homepage/createNewReview")
public class CreateReviewServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        ReviewServices reviewServices = new ReviewServices(req, resp);
        reviewServices.createReview();
    }
}
