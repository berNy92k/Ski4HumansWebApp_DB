package pl.ski4humans.controller.admin.category;

import pl.ski4humans.service.admin.CategoryServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/createNewCategory")
public class CreateCategoryServlet extends HttpServlet {

  @Override
  protected void doPost(final HttpServletRequest req,
                        final HttpServletResponse resp) throws ServletException, IOException {

    final CategoryServices categoryServices = new CategoryServices(req, resp);
    categoryServices.createCategory();
  }
}
