package pl.ski4humans.controller.admin.manufacturer;

import pl.ski4humans.service.admin.ManufacturerServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/deleteManufacturer")
public class DeleteManufacturerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ManufacturerServices manufacturerServices = new ManufacturerServices(req,resp);
        manufacturerServices.deleteManufacturer();
    }
}
