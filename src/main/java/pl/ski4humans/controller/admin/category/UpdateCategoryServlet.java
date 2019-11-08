package pl.ski4humans.controller.admin.category;

import pl.ski4humans.service.admin.CategoryServices;
import pl.ski4humans.service.admin.UserServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/updateCategory")
public class UpdateCategoryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoryServices categoryServices = new CategoryServices(req,resp);
        categoryServices.updateCategory();
    }
}
