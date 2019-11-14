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
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

public class EquipmentServices {
    private EquipmentDAO equipmentDAO;
    private ManufacturerDAO manufacturerDAO;
    private CategoryDAO categoryDAO;
    private HttpServletRequest request;
    private HttpServletResponse response;

    public EquipmentServices(HttpServletRequest req, HttpServletResponse resp) {
        this.request = req;
        this.response = resp;
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ski4HumansWebApp");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        equipmentDAO = new EquipmentDAO(entityManager);
        manufacturerDAO = new ManufacturerDAO(entityManager);
        categoryDAO = new CategoryDAO(entityManager);
    }

    public void equipmentList() throws ServletException, IOException {
        equipmentList(Constants.NULL);
    }

    public void equipmentList(String message) throws ServletException, IOException {
        String equipmentCategory = request.getParameter("eq");
        String equipmentSex = request.getParameter("sex");

        List<Equipment> equipments;
        if (equipmentCategory != null && choiceSex(equipmentSex).equals(SexEnum.ALL.getSex())) {
            int category = choiceCategory(equipmentCategory);
            equipments = equipmentDAO.listAllByCategory(category);
        } else if (equipmentCategory != null && (!choiceSex(equipmentSex).equals(SexEnum.ZERO.getSex()) && !choiceSex(equipmentSex).equals(SexEnum.ALL.getSex()))) {
            int category = choiceCategory(equipmentCategory);
            String sex = choiceSex(equipmentSex);
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
            request.setAttribute("message", message);
        } else if (equipments != null && equipments.size() == 0) {
            request.setAttribute("message", Constants.LACK_OF_EQUIPMENT_IN_DB);
            request.setAttribute("messageEmpty", true);
        } else {
            if (equipments != null) {
                equipments.size();
                request.setAttribute("messageEmpty", false);
            }
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(Constants.EQUIPMENT_LIST_URL);
        requestDispatcher.forward(request, response);
    }

    public void viewEquipment() throws ServletException, IOException {
        Integer equipmentId = Integer.valueOf(request.getParameter("id"));
        Equipment equipment = equipmentDAO.get(equipmentId);

        if (equipment != null) {
            request.setAttribute("equipment", equipment);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(Constants.EQUIPMENT_VIEW_URL);
        requestDispatcher.forward(request, response);
    }

    public void precreateEquipment() throws ServletException, IOException {
        String sex = request.getParameter("sex");
        String eq = request.getParameter("eq");

        List<Manufacturer> manufacturers = manufacturerDAO.listAll();
        List<Category> categories = categoryDAO.listAll();

        request.setAttribute("manufacturers", manufacturers);
        request.setAttribute("categories", categories);

        request.setAttribute("sex", sex);
        request.setAttribute("eqCat", eq);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(Constants.EQUIPMENT_CREATE_URL);
        requestDispatcher.forward(request, response);
    }

    public void createEquipment() throws ServletException, IOException {
        String name = request.getParameter("name");
        Integer manufacturerId = Integer.valueOf(request.getParameter("manufacturerName"));
        float price = Float.parseFloat(request.getParameter("price"));
        String lengthOrSize = request.getParameter("lengthOrSize");
        String sex = request.getParameter("sex");
        Integer categoryId = Integer.valueOf(request.getParameter("categoryName"));
        String shortDescription = request.getParameter("shortDescription");
        String longDescription = request.getParameter("longDescription");

        Date publishDate = new Date();
        Date lastUpdateTime = new Date();

        byte[] bytes = new byte[0];
        Part equipmentImage = request.getPart("equipmentImage");
        if (equipmentImage != null && equipmentImage.getSize() > 0) {
            long size = equipmentImage.getSize();
            bytes = new byte[(int) size];

            InputStream inputStream = equipmentImage.getInputStream();
            inputStream.read(bytes);
            inputStream.close();
        }

        List<Equipment> equipments = equipmentDAO.findByName(name);

        if (equipments.size() > 0) {
            equipmentIsCreated(name + Constants.EQUIPMENT_ALREADY_EXIST_IN_DB);
        } else {
            Manufacturer manufacturer = manufacturerDAO.get(manufacturerId);
            Category category = categoryDAO.get(categoryId);

            Equipment newEquipment = new Equipment();
            newEquipment.setName(name);
            newEquipment.setManufacturer(manufacturer);
            newEquipment.setShortDescription(shortDescription);
            newEquipment.setLongDescription(longDescription);
            newEquipment.setSex(sex);
            newEquipment.setImage(bytes);
            newEquipment.setPrice(price);
            newEquipment.setLengthOrSize(lengthOrSize);
            newEquipment.setCategory(category);
            newEquipment.setPublishDate(publishDate);
            newEquipment.setLastUpdateTime(lastUpdateTime);

            Equipment equipment = equipmentDAO.create(newEquipment);
            if (equipment.getEquipmentId() > 0) {
                equipmentIsCreated(Constants.NEW_EQUIPMENT_WAS_CREATED);
            } else {
                equipmentIsCreated(Constants.NEW_EQUIPMENT_WAS_NOT_CREATED);
            }
        }
    }

    private void equipmentIsCreated(String message) throws ServletException, IOException {
        request.setAttribute("message", message);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(Constants.EQUIPMENT_IS_CREATED_URL);
        requestDispatcher.forward(request, response);
    }

    public void editEquipment() throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        Equipment equipment = equipmentDAO.get(id);
        List<Category> categories = categoryDAO.listAll();
        List<Manufacturer> manufacturers = manufacturerDAO.listAll();

        if (equipment != null) {
            request.setAttribute("equipment", equipment);
            request.setAttribute("categories", categories);
            request.setAttribute("manufacturers", manufacturers);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(Constants.EQUIPMENT_CREATE_URL);
            requestDispatcher.forward(request, response);
        } else {
            equipmentIsCreated(Constants.COULD_NOT_FIND_EQUIPMENT_BY_ID + id);
        }
    }

    public void updateEquipment() throws ServletException, IOException {
        String name = request.getParameter("name");
        Integer manufacturerId = Integer.valueOf(request.getParameter("manufacturerName"));
        float price = Float.parseFloat(request.getParameter("price"));
        String lengthOrSize = request.getParameter("lengthOrSize");
        String sex = request.getParameter("sex");
        Integer categoryId = Integer.valueOf(request.getParameter("categoryName"));
        String shortDescription = request.getParameter("shortDescription");
        String longDescription = request.getParameter("longDescription");

        int equipmentId = Integer.parseInt(request.getParameter("equipmentId"));
        Equipment equipmentFromDB_AlreadyExist = equipmentDAO.get(equipmentId);

        Date publishDate = equipmentFromDB_AlreadyExist.getPublishDate();
        Date lastUpdateTime = new Date();

        byte[] bytes;
        Part equipmentImage = request.getPart("equipmentImage");
        if (equipmentImage != null && equipmentImage.getSize() > 0) {
            long size = equipmentImage.getSize();
            bytes = new byte[(int) size];

            InputStream inputStream = equipmentImage.getInputStream();
            inputStream.read(bytes);
            inputStream.close();
        } else {
            bytes = equipmentFromDB_AlreadyExist.getImage();
        }

        List<Equipment> equipments = equipmentDAO.findByName(name);

        if (equipments.size() > 0) {
            equipmentIsCreated(name + Constants.EQUIPMENT_ALREADY_EXIST_IN_DB);
        } else {
            Manufacturer manufacturer = manufacturerDAO.get(manufacturerId);
            Category category = categoryDAO.get(categoryId);

            Equipment newEquipment = new Equipment();
            newEquipment.setEquipmentId(Integer.valueOf(equipmentId));
            newEquipment.setName(name);
            newEquipment.setManufacturer(manufacturer);
            newEquipment.setShortDescription(shortDescription);
            newEquipment.setLongDescription(longDescription);
            newEquipment.setSex(sex);
            newEquipment.setImage(bytes);
            newEquipment.setPrice(price);
            newEquipment.setLengthOrSize(lengthOrSize);
            newEquipment.setCategory(category);
            newEquipment.setPublishDate(publishDate);
            newEquipment.setLastUpdateTime(lastUpdateTime);

            Equipment equipment = equipmentDAO.update(newEquipment);
            if (equipment.getEquipmentId() > 0) {
                equipmentIsCreated(Constants.EQUIPMENT_WAS_UPDATED);
            } else {
                equipmentIsCreated(Constants.EQUIPMENT_WAS_NOT_UPDATED);
            }
        }
    }

    public void deleteEquipment() throws ServletException, IOException {
        Integer equipmentId = Integer.valueOf(request.getParameter("id"));

        Equipment equipment = equipmentDAO.get(equipmentId);

        if (equipment != null) {
            equipmentDAO.delete(equipmentId);
            equipmentList(Constants.EQUIPMENT_WAS_DELETED);
        } else {
            equipmentList(Constants.COULD_NOT_FIND_EQUIPMENT_BY_ID + equipmentId + Constants.DELETED_BY_ANOTHER_CATEGORY_ADMIN);
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
