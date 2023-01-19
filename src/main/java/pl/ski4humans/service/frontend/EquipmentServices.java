package pl.ski4humans.service.frontend;

import pl.ski4humans.dao.EquipmentDAO;
import pl.ski4humans.dao.ReviewDAO;
import pl.ski4humans.entity.Equipment;
import pl.ski4humans.entity.Review;
import pl.ski4humans.enums.CategoryEnum;
import pl.ski4humans.enums.CategoryPLEnum;
import pl.ski4humans.enums.SexEnum;
import pl.ski4humans.enums.SexPLEnum;
import pl.ski4humans.service.admin.ConstantsPL;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

public class EquipmentServices {

  private final EquipmentDAO equipmentDAO;
  private final ReviewDAO reviewDAO;
  private final HttpServletRequest request;
  private final HttpServletResponse response;

  public EquipmentServices(final HttpServletRequest req, final HttpServletResponse resp) {
    this.request = req;
    this.response = resp;
    EntityManager entityManager = Persistence
        .createEntityManagerFactory("Ski4HumansWebApp")
        .createEntityManager();
    equipmentDAO = new EquipmentDAO(entityManager);
    reviewDAO = new ReviewDAO(entityManager);
  }

  public void equipmentList() throws ServletException, IOException {
    final String equipmentCategory = request.getParameter("eq");
    final String equipmentSex = request.getParameter("sex");

    final List<Equipment> equipments;
    if (equipmentCategory != null && !choiceSex(equipmentSex).equals(SexEnum.ZERO.getSex())) {
      final int category = choiceCategory(equipmentCategory);
      final String sex = choiceSex(equipmentSex);
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
      request.setAttribute(ConstantsPL.MESSAGE, ConstantsFrontendPL.Equipment.LACK_OF_EQUIPMENT_IN_DB);
      request.setAttribute("messageEmpty", true);
    } else {
      if (equipments != null) {
        request.setAttribute("messageEmpty", false);
      }
    }

    request
        .getRequestDispatcher(ConstantsFrontendPL.Equipment.EQUIPMENT_LIST_URL)
        .forward(request, response);
  }

  public void viewEquipment() throws ServletException, IOException {
    final int equipmentId = Integer.parseInt(request.getParameter("id"));

    final Equipment equipment = equipmentDAO.get(equipmentId);
    final List<Review> reviews = reviewDAO.findAllByEquipmentId(equipmentId);

    if (equipment != null) {
      request.setAttribute("equipment", equipment);
    }

    if (reviews != null && reviews.size() > 0) {
      request.setAttribute("reviews", reviews);

      int sum = 0;
      for (final Review review : reviews) {
        sum = sum + review.getRating();
      }
      final float reviewsAverage = (float) sum / reviews.size();

      final int fullStart = (int) reviewsAverage;
      request.setAttribute("reviewsAverageFull", fullStart);

      final int halfStart = reviewsAverage > fullStart ? 1 : 0;
      request.setAttribute("reviewsAverageHalf", halfStart);
    }

    request
        .getRequestDispatcher(ConstantsFrontendPL.Equipment.EQUIPMENT_VIEW_URL)
        .forward(request, response);
  }

  public void equipmentShortList() throws ServletException, IOException {
    final List<Equipment> equipments = equipmentDAO.listAll();

    if (equipments != null && equipments.size() < 5 && equipments.size() != 0) {
      request.setAttribute("equipmentShortList", equipments);
      request.setAttribute("messageEmpty", false);
    } else if (equipments != null && equipments.size() > 4) {
      final List<Equipment> newShortList = new LinkedList<>();
      for (int i = 0; i < 4; i++) {
        newShortList.add(equipments.get(i));
      }

      request.setAttribute("equipmentShortList", newShortList);
      request.setAttribute("messageEmpty", false);
    } else {
      request.setAttribute("messageEmpty", true);
    }

    request
        .getRequestDispatcher(ConstantsFrontendPL.Homepage.HOMEPAGE_URL)
        .forward(request, response);
  }

  public void searchEquipmentList() throws ServletException, IOException {
    final String search = request.getParameter("search");

    List<Equipment> equipments = null;
    if (search == null || search.length() == 0) {
      equipmentShortList();
    } else {
      equipments = equipmentDAO.listAllByNameOrDescription(search);
    }

    request.setAttribute("equipmentList", equipments);
    request.setAttribute("equipmentCategoryName", ConstantsFrontendPL.Homepage.SEARCH_BY_WORD);
    if (search != null) {
      request.setAttribute("equipmentSex", search);
    }

    request
        .getRequestDispatcher(ConstantsFrontendPL.Equipment.EQUIPMENT_LIST_URL)
        .forward(request, response);
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
