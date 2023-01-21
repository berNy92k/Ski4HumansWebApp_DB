package pl.ski4humans.controller.admin.manufacturer;

import pl.ski4humans.service.admin.ManufacturerServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/createNewManufacturer")
@MultipartConfig(
    fileSizeThreshold = 1024 * 10,
    maxFileSize = 1024 * 300,
    maxRequestSize = 1024 * 1024
)
public class CreateManufacturerServlet extends HttpServlet {

  @Override
  protected void doPost(final HttpServletRequest req,
                        final HttpServletResponse resp) throws ServletException, IOException {

    final ManufacturerServices manufacturerServices = new ManufacturerServices(req, resp);
    manufacturerServices.createManufacturer();
  }
}
