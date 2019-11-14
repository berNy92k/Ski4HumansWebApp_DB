package pl.ski4humans.controller.frontend.equipment;


import pl.ski4humans.service.frontend.EquipmentServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/equipment")
public class ListEquipmentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        EquipmentServices equipmentServices = new EquipmentServices(req, resp);
        equipmentServices.equipmentList();
    }
}
