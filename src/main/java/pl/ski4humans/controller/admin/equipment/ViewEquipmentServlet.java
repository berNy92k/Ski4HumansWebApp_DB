package pl.ski4humans.controller.admin.equipment;

import pl.ski4humans.service.admin.EquipmentServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/viewEquipment")
public class ViewEquipmentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        EquipmentServices equipmentServices = new EquipmentServices(req, resp);
        equipmentServices.viewEquipment();
    }
}
