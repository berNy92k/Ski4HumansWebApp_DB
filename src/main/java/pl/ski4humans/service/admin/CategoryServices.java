package pl.ski4humans.service.admin;

import pl.ski4humans.dao.CategoryDAO;
import pl.ski4humans.entity.Category;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class CategoryServices {

  private final CategoryDAO categoryDAO;
  private final HttpServletRequest request;
  private final HttpServletResponse response;

  public CategoryServices(final HttpServletRequest req, final HttpServletResponse resp) {
    this.request = req;
    this.response = resp;
    EntityManager entityManager = Persistence
        .createEntityManagerFactory("Ski4HumansWebApp")
        .createEntityManager();
    categoryDAO = new CategoryDAO(entityManager);
  }

  public void categoryList() throws ServletException, IOException {
    categoryList(ConstantsAdminPL.NULL);
  }

  public void categoryList(final String message) throws ServletException, IOException {
    final List<Category> categories = categoryDAO.listAll();

    request.setAttribute("categoryList", categories);
    if (message != null) {
      request.setAttribute(ConstantsAdminPL.MESSAGE, message);
    }

    request
        .getRequestDispatcher(ConstantsAdminPL.Category.CATEGORY_LIST_URL)
        .forward(request, response);
  }

  public void createCategory() throws ServletException, IOException {
    final String name = request.getParameter("name");

    final List<Category> categories = categoryDAO.findByName(name);

    if (categories.size() > 0) {
      categoryList(name + ConstantsAdminPL.Category.CATEGORY_NAME_ALREADY_EXIST_IN_DB);
    } else {
      final Category newCategory = Category.builder().name(name).build();
      categoryDAO.create(newCategory);
      categoryList(ConstantsAdminPL.Category.NEW_CATEGORY_WAS_CREATED);
    }
  }

  public void editCategory() throws ServletException, IOException {
    final int id = Integer.parseInt(request.getParameter("id"));
    final Category category = categoryDAO.get(id);

    if (category != null && id > 0 && id < 8) {
      categoryList(ConstantsAdminPL.Category.CATEGORY_CAN_NOT_BE_UPDATED_SQL_ADMIN);
    } else if (category != null) {
      request.setAttribute("category", category);

      request
          .getRequestDispatcher(ConstantsAdminPL.Category.CATEGORY_CREATE_URL)
          .forward(request, response);
    } else {
      categoryList(ConstantsAdminPL.Category.COULD_NOT_FIND_CATEGORY_BY_ID + id);
    }
  }

  public void updateCategory() throws ServletException, IOException {
    final Integer categoryId = Integer.valueOf(request.getParameter("categoryId"));
    final String name = request.getParameter("name");

    boolean isMoreCategoriesInDatabase = false;

    final Category categoryFoundById = categoryDAO.get(categoryId);

    final List<Category> categories = categoryDAO.findByName(name);
    Category categoryFoundByName = null;
    if (categories.size() == 1) {
      categoryFoundByName = categories.get(0);
    } else if (categories.size() > 1) {
      isMoreCategoriesInDatabase = true;
    }

    if (isMoreCategoriesInDatabase) {

      categoryList(ConstantsAdminPL.Category.CATEGORY_WAS_NOT_UPDATED
          + name + ConstantsAdminPL.Category.CATEGORY_NAME_ALREADY_EXIST_IN_DB);
    } else if (categoryFoundByName != null
        && !categoryFoundByName.getCategoryId().equals(categoryFoundById.getCategoryId())) {

      categoryList(ConstantsAdminPL.Category.CATEGORY_WAS_NOT_UPDATED
          + name + ConstantsAdminPL.Category.CATEGORY_NAME_ALREADY_EXIST_IN_DB);
    } else {

      final Category newCategory = Category.builder()
          .categoryId(categoryId)
          .name(name)
          .build();
      categoryDAO.update(newCategory);

      categoryList(ConstantsAdminPL.Category.CATEGORY_WAS_UPDATED);
    }
  }

  public void deleteCategory() throws ServletException, IOException {
    final int categoryId = Integer.parseInt(request.getParameter("id"));

    final Category category = categoryDAO.get(categoryId);

    if (category != null && categoryId > 0 && categoryId < 8) {
      categoryList(ConstantsAdminPL.Category.CATEGORY_CAN_NOT_BE_DELETED_SQL_ADMIN);
    } else if (category != null) {
      categoryDAO.delete(categoryId);
      categoryList(ConstantsAdminPL.Category.CATEGORY_WAS_DELETED);
    } else {
      categoryList(ConstantsAdminPL.Category.COULD_NOT_FIND_CATEGORY_BY_ID
          + categoryId + ConstantsAdminPL.Category.DELETED_BY_ANOTHER_CATEGORY_ADMIN);
    }
  }
}
