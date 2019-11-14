package pl.ski4humans.service.frontend;

import pl.ski4humans.dao.EquipmentDAO;
import pl.ski4humans.entity.Equipment;
import pl.ski4humans.enums.CategoryEnum;
import pl.ski4humans.enums.CategoryPLEnum;
import pl.ski4humans.enums.SexEnum;
import pl.ski4humans.enums.SexPLEnum;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

public class EquipmentServices {
    private EquipmentDAO equipmentDAO;
    private HttpServletRequest request;
    private HttpServletResponse response;

    public EquipmentServices(HttpServletRequest req, HttpServletResponse resp) {
        this.request = req;
        this.response = resp;
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ski4HumansWebApp");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        equipmentDAO = new EquipmentDAO(entityManager);
    }

    public void equipmentList() throws ServletException, IOException {
        String equipmentCategory = request.getParameter("eq");
        String equipmentSex = request.getParameter("sex");

        List<Equipment> equipments;
        if (equipmentCategory != null && (!choiceSex(equipmentSex).equals(SexEnum.ZERO.getSex()))) {
            int category = choiceCategory(equipmentCategory);
            String sex = choiceSex(equipmentSex);
            equipments = equipmentDAO.listAllByCategoryAndSex(category, sex);
        } else {
            equipments = equipmentDAO.listAll();
        }

        request.setAttribute("equipmentList", equipments);
        if (equipmentCategory != null) {
            request.setAttribute("equipmentCategoryName", plVersionOfCategory(equipmentCategory));
        }
        if (equipmentSex != null) {
            request.setAttribute("equipmentSex", plVersionOfSex(equipmentSex));
        }

        if (equipments != null && equipments.size() == 0) {
            request.setAttribute("message", ConstantsFrontendPL.LACK_OF_EQUIPMENT_IN_DB);
            request.setAttribute("messageEmpty", true);
        } else {
            if (equipments != null) {
                request.setAttribute("messageEmpty", false);
            }
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.EQUIPMENT_LIST_URL);
        requestDispatcher.forward(request, response);
    }

    public void viewEquipment() throws ServletException, IOException {
        Integer equipmentId = Integer.valueOf(request.getParameter("id"));
        Equipment equipment = equipmentDAO.get(equipmentId);

        if (equipment != null) {
            request.setAttribute("equipment", equipment);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.EQUIPMENT_VIEW_URL);
        requestDispatcher.forward(request, response);
    }

    public void equipmentShortList() throws ServletException, IOException {
        List<Equipment> equipments = equipmentDAO.listAll();

        if (equipments != null && equipments.size() < 5 && equipments.size() != 0) {
            request.setAttribute("equipmentShortList", equipments);
            request.setAttribute("messageEmpty", false);
        } else if (equipments != null && equipments.size() > 4) {
            List<Equipment> newShortList = new LinkedList<>();
            for (int i = 0; i < 4; i++) {
                newShortList.add(equipments.get(i));
            }

            request.setAttribute("equipmentShortList", newShortList);
            request.setAttribute("messageEmpty", false);
        } else {
            request.setAttribute("messageEmpty", true);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.HOMEPAGE_URL);
        requestDispatcher.forward(request, response);
    }

    public void searchEquipmentList() throws ServletException, IOException {
        String search = request.getParameter("search");

        List<Equipment> equipments = null;
        if (search != null && search.length() == 0) {
            equipmentShortList();
        } else if (search == null) {
            equipmentShortList();
        } else {
            equipments = equipmentDAO.listAllByNameOrDescription(search);
        }

        request.setAttribute("equipmentList", equipments);
        request.setAttribute("equipmentCategoryName", ConstantsFrontendPL.SEARCH_BY_WORD);
        if (search != null) {
            request.setAttribute("equipmentSex", search);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.EQUIPMENT_LIST_URL);
        requestDispatcher.forward(request, response);
    }

    private String choiceSex(String equipmentSex) {
        switch (equipmentSex) {
            case "woman":
                return SexEnum.WOMAN.getSex();
            case "man":
                return SexEnum.MAN.getSex();
            case "child":
                return SexEnum.CHILD.getSex();
            default:
                return SexEnum.ZERO.getSex();
        }
    }

    private String plVersionOfSex(String equipmentSex) {
        switch (equipmentSex) {
            case "woman":
                return SexPLEnum.WOMAN.getSex();
            case "man":
                return SexPLEnum.MAN.getSex();
            case "child":
                return SexPLEnum.CHILD.getSex();
            default:
                return SexPLEnum.ZERO.getSex();
        }
    }

    private int choiceCategory(String equipmentCategory) {
        switch (equipmentCategory) {
            case "skis":
                return CategoryEnum.SKIS.getCategory();
            case "skiShoes":
                return CategoryEnum.SKISHOES.getCategory();
            case "skiPoles":
                return CategoryEnum.SKIPOLES.getCategory();
            case "skiHelmets":
                return CategoryEnum.SKIHELMETS.getCategory();
            case "skiGoggles":
                return CategoryEnum.SKIGOGGLES.getCategory();
            case "skiGloves":
                return CategoryEnum.SKIGLOVES.getCategory();
            case "thermoctiveClothing":
                return CategoryEnum.THERMOACTIVECLOTHING.getCategory();
            default:
                return CategoryEnum.ZERO.getCategory();
        }
    }

    private String plVersionOfCategory(String equipmentCategory) {
        switch (equipmentCategory) {
            case "skis":
                return CategoryPLEnum.SKIS.getCategory();
            case "skiShoes":
                return CategoryPLEnum.SKISHOES.getCategory();
            case "skiPoles":
                return CategoryPLEnum.SKIPOLES.getCategory();
            case "skiHelmets":
                return CategoryPLEnum.SKIHELMETS.getCategory();
            case "skiGoggles":
                return CategoryPLEnum.SKIGOGGLES.getCategory();
            case "skiGloves":
                return CategoryPLEnum.SKIGLOVES.getCategory();
            case "thermoactiveClothing":
                return CategoryPLEnum.THERMOACTIVECLOTHING.getCategory();
            default:
                return CategoryPLEnum.ZERO.getCategory();
        }
    }
}
