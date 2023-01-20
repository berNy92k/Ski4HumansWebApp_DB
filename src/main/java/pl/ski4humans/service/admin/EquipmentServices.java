package pl.ski4humans.service.admin;

import pl.ski4humans.dao.CategoryDAO;
import pl.ski4humans.dao.EquipmentDAO;
import pl.ski4humans.dao.ManufacturerDAO;
import pl.ski4humans.entity.Category;
import pl.ski4humans.entity.Equipment;
import pl.ski4humans.entity.Manufacturer;
import pl.ski4humans.enums.CategoryEnum;
import pl.ski4humans.enums.CategoryPLEnum;
import pl.ski4humans.enums.SexEnum;
import pl.ski4humans.enums.SexPLEnum;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

public class EquipmentServices {
  private final EquipmentDAO equipmentDAO;
  private final ManufacturerDAO manufacturerDAO;
  private final CategoryDAO categoryDAO;
  private final HttpServletRequest request;
  private final HttpServletResponse response;

  public EquipmentServices(final HttpServletRequest req, final HttpServletResponse resp) {
    this.request = req;
    this.response = resp;
    EntityManager entityManager = Persistence
        .createEntityManagerFactory("Ski4HumansWebApp")
        .createEntityManager();
    equipmentDAO = new EquipmentDAO(entityManager);
    manufacturerDAO = new ManufacturerDAO(entityManager);
    categoryDAO = new CategoryDAO(entityManager);
  }

  public void equipmentList() throws ServletException, IOException {
    equipmentList(ConstantsAdminPL.NULL);
  }

  public void equipmentList(final String message) throws ServletException, IOException {
    final String equipmentCategory = request.getParameter("eq");
    final String equipmentSex = request.getParameter("sex");

    final List<Equipment> equipments;
    if (equipmentCategory != null && choiceSex(equipmentSex).equals(SexEnum.ALL.getSex())) {
      final int category = choiceCategory(equipmentCategory);
      equipments = equipmentDAO.listAllByCategory(category);
    } else if (equipmentCategory != null
        && (!choiceSex(equipmentSex).equals(SexEnum.ZERO.getSex())
        && !choiceSex(equipmentSex).equals(SexEnum.ALL.getSex()))) {
      final int category = choiceCategory(equipmentCategory);
      final String sex = choiceSex(equipmentSex);
      equipments = equipmentDAO.listAllByCategoryAndSex(category, sex);
    } else {
      equipments = equipmentDAO.listAll();
    }

    request.setAttribute("equipmentList", equipments);
    if (equipmentCategory != null) {
      request.setAttribute("equipmentCategoryName", plVersionOfCategory(equipmentCategory));
      request.setAttribute("eqCat", equipmentCategory);
    }
    if (equipmentSex != null) {
      request.setAttribute("equipmentSex", plVersionOfSex(equipmentSex));
      request.setAttribute("sex", equipmentSex);
    }

    if (message != null) {
      request.setAttribute(ConstantsAdminPL.MESSAGE, message);
    } else if (equipments != null && equipments.size() == 0) {
      request.setAttribute(ConstantsAdminPL.MESSAGE, ConstantsAdminPL.Equipment.LACK_OF_EQUIPMENT_IN_DB);
      request.setAttribute("messageEmpty", true);
    } else {
      if (equipments != null) {
        request.setAttribute("messageEmpty", false);
      }
    }

    request
        .getRequestDispatcher(ConstantsAdminPL.Equipment.EQUIPMENT_LIST_URL)
        .forward(request, response);
  }

  public void viewEquipment() throws ServletException, IOException {
    final Integer equipmentId = Integer.valueOf(request.getParameter("id"));
    final Equipment equipment = equipmentDAO.get(equipmentId);

    if (equipment != null) {
      request.setAttribute("equipment", equipment);
    }

    request
        .getRequestDispatcher(ConstantsAdminPL.Equipment.EQUIPMENT_VIEW_URL)
        .forward(request, response);
  }

  public void precreateEquipment() throws ServletException, IOException {
    final String sex = request.getParameter("sex");
    final String eq = request.getParameter("eq");
    final List<Manufacturer> manufacturers = manufacturerDAO.listAll();
    final List<Category> categories = categoryDAO.listAll();

    request.setAttribute("manufacturers", manufacturers);
    request.setAttribute("categories", categories);
    request.setAttribute("sex", sex);
    request.setAttribute("eqCat", eq);

    request
        .getRequestDispatcher(ConstantsAdminPL.Equipment.EQUIPMENT_CREATE_URL)
        .forward(request, response);
  }

  public void createEquipment() throws ServletException, IOException {
    final String name = request.getParameter("name");
    final Integer manufacturerId = Integer.valueOf(request.getParameter("manufacturerName"));
    final float price = Float.parseFloat(request.getParameter("price"));
    final String lengthOrSize = request.getParameter("lengthOrSize");
    final String sex = request.getParameter("sex");
    final Integer categoryId = Integer.valueOf(request.getParameter("categoryName"));
    final String shortDescription = request.getParameter("shortDescription");
    final String longDescription = request.getParameter("longDescription");
    final Date publishDate = new Date();
    final Date lastUpdateTime = new Date();

    byte[] bytes = new byte[0];
    final Part equipmentImage = request.getPart("equipmentImage");
    if (equipmentImage != null && equipmentImage.getSize() > 0) {
      final long size = equipmentImage.getSize();
      bytes = new byte[(int) size];

      final InputStream inputStream = equipmentImage.getInputStream();
      inputStream.read(bytes);
      inputStream.close();
    }

    final List<Equipment> equipments = equipmentDAO.findByName(name);

    if (equipments.size() > 0) {
      equipmentIsCreated(name + ConstantsAdminPL.Equipment.EQUIPMENT_ALREADY_EXIST_IN_DB);
    } else {
      final Manufacturer manufacturer = manufacturerDAO.get(manufacturerId);
      final Category category = categoryDAO.get(categoryId);

      final Equipment newEquipment = Equipment.builder()
          .name(name)
          .manufacturer(manufacturer)
          .shortDescription(shortDescription)
          .longDescription(longDescription)
          .sex(sex)
          .image(bytes)
          .price(price)
          .lengthOrSize(lengthOrSize)
          .category(category)
          .publishDate(publishDate)
          .lastUpdateTime(lastUpdateTime)
          .build();

      final Equipment equipment = equipmentDAO.create(newEquipment);
      if (equipment.getEquipmentId() > 0) {
        equipmentIsCreated(ConstantsAdminPL.Equipment.NEW_EQUIPMENT_WAS_CREATED);
      } else {
        equipmentIsCreated(ConstantsAdminPL.Equipment.NEW_EQUIPMENT_WAS_NOT_CREATED);
      }
    }
  }

  private void equipmentIsCreated(final String message) throws ServletException, IOException {
    request.setAttribute(ConstantsAdminPL.MESSAGE, message);

    request
        .getRequestDispatcher(ConstantsAdminPL.Equipment.EQUIPMENT_IS_CREATED_URL)
        .forward(request, response);
  }

  public void editEquipment() throws ServletException, IOException {
    final Integer id = Integer.valueOf(request.getParameter("id"));
    final Equipment equipment = equipmentDAO.get(id);
    final List<Category> categories = categoryDAO.listAll();
    final List<Manufacturer> manufacturers = manufacturerDAO.listAll();

    if (equipment != null) {
      request.setAttribute("equipment", equipment);
      request.setAttribute("categories", categories);
      request.setAttribute("manufacturers", manufacturers);

      request
          .getRequestDispatcher(ConstantsAdminPL.Equipment.EQUIPMENT_CREATE_URL)
          .forward(request, response);
    } else {
      equipmentIsCreated(ConstantsAdminPL.Equipment.COULD_NOT_FIND_EQUIPMENT_BY_ID + id);
    }
  }

  public void updateEquipment() throws ServletException, IOException {
    final String name = request.getParameter("name");
    final Integer manufacturerId = Integer.valueOf(request.getParameter("manufacturerName"));
    final float price = Float.parseFloat(request.getParameter("price"));
    final String lengthOrSize = request.getParameter("lengthOrSize");
    final String sex = request.getParameter("sex");
    final Integer categoryId = Integer.valueOf(request.getParameter("categoryName"));
    final String shortDescription = request.getParameter("shortDescription");
    final String longDescription = request.getParameter("longDescription");
    final int equipmentId = Integer.parseInt(request.getParameter("equipmentId"));
    final Date lastUpdateTime = new Date();

    final Equipment equipmentFromDb = equipmentDAO.get(equipmentId);
    final Date publishDate = equipmentFromDb.getPublishDate();

    byte[] bytes;
    final Part equipmentImage = request.getPart("equipmentImage");
    if (equipmentImage != null && equipmentImage.getSize() > 0) {
      final long size = equipmentImage.getSize();
      bytes = new byte[(int) size];

      final InputStream inputStream = equipmentImage.getInputStream();
      inputStream.read(bytes);
      inputStream.close();
    } else {
      bytes = equipmentFromDb.getImage();
    }

    final List<Equipment> equipments = equipmentDAO.findByName(name);

    if (equipments.size() > 1) {
      equipmentIsCreated(name + ConstantsAdminPL.Equipment.EQUIPMENT_ALREADY_EXIST_IN_DB);
    } else if (equipments.size() == 1 && equipments.get(0).getEquipmentId() != equipmentId) {
      equipmentIsCreated(name + ConstantsAdminPL.Equipment.EQUIPMENT_ALREADY_EXIST_IN_DB);
    } else {
      final Manufacturer manufacturer = manufacturerDAO.get(manufacturerId);
      final Category category = categoryDAO.get(categoryId);

      final Equipment newEquipment = Equipment.builder()
          .equipmentId(equipmentId)
          .name(name)
          .manufacturer(manufacturer)
          .shortDescription(shortDescription)
          .longDescription(longDescription)
          .sex(sex)
          .image(bytes)
          .price(price)
          .lengthOrSize(lengthOrSize)
          .category(category)
          .publishDate(publishDate)
          .lastUpdateTime(lastUpdateTime)
          .build();

      final Equipment equipment = equipmentDAO.update(newEquipment);
      if (equipment.getEquipmentId() > 0) {
        equipmentIsCreated(ConstantsAdminPL.Equipment.EQUIPMENT_WAS_UPDATED);
      } else {
        equipmentIsCreated(ConstantsAdminPL.Equipment.EQUIPMENT_WAS_NOT_UPDATED);
      }
    }
  }

  public void deleteEquipment() throws ServletException, IOException {
    final Integer equipmentId = Integer.valueOf(request.getParameter("id"));
    final Equipment equipment = equipmentDAO.get(equipmentId);

    if (equipment != null) {
      equipmentDAO.delete(equipmentId);
      equipmentList(ConstantsAdminPL.Equipment.EQUIPMENT_WAS_DELETED);
    } else {
      equipmentList(ConstantsAdminPL.Equipment.COULD_NOT_FIND_EQUIPMENT_BY_ID
          + equipmentId + ConstantsAdminPL.Equipment.DELETED_BY_ANOTHER_EQUIPMENT_ADMIN);
    }
  }

  private String choiceSex(String equipmentSex) {
    switch (equipmentSex) {
      case "all":
        return SexEnum.ALL.getSex();
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
      case "all":
        return SexPLEnum.ALL.getSex();
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
