package pl.ski4humans.controller.frontend.manufacturer;

import pl.ski4humans.service.frontend.ManufacturerServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/manufacturer")
public class ListManufacturerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ManufacturerServices manufacturerServices = new ManufacturerServices(req, resp);
        manufacturerServices.manufacturerList();
    }
}
