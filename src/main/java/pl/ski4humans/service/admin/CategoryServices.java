package pl.ski4humans.service.admin;

import pl.ski4humans.dao.CategoryDAO;
import pl.ski4humans.entity.Category;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class CategoryServices {
    private CategoryDAO categoryDAO;
    private HttpServletRequest request;
    private HttpServletResponse response;

    public CategoryServices(HttpServletRequest req, HttpServletResponse resp) {
        this.request = req;
        this.response = resp;
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ski4HumansWebApp");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        categoryDAO = new CategoryDAO(entityManager);
    }

    public void categoryList() throws ServletException, IOException {
        categoryList(Constants.NULL);
    }

    public void categoryList(String message) throws ServletException, IOException {
        List<Category> categoryList = categoryDAO.listAll();

        request.setAttribute("categoryList", categoryList);
        if (message != null) {
            request.setAttribute("message", message);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(Constants.CATEGORY_LIST_URL);
        requestDispatcher.forward(request, response);
    }

    public void createCategory() throws ServletException, IOException {
        String name = request.getParameter("name");

        List<Category> categories = categoryDAO.findByName(name);

        if (categories.size() > 0) {
            categoryList(name + Constants.CATEGORY_NAME_ALREADY_EXIST_IN_DB);
        } else {
            Category newCategory = new Category(name);
            categoryDAO.create(newCategory);
            categoryList(Constants.NEW_CATEGORY_WAS_CREATED);
        }
    }

    public void editCategory() throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        Category category = categoryDAO.get(id);

        if (category != null) {
            request.setAttribute("category", category);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(Constants.CATEGORY_CREATE_URL);
            requestDispatcher.forward(request, response);
        } else {
            categoryList(Constants.COULD_NOT_FIND_CATEGORY_BY_ID + id);
        }
    }

    public void updateCategory() throws ServletException, IOException {
        Integer categoryId = Integer.valueOf(request.getParameter("categoryId"));
        String name = request.getParameter("name");

        boolean isMoreCategoriesInDatabase = false;

        Category categoryFoundById = categoryDAO.get(categoryId);

        List<Category> categories = categoryDAO.findByName(name);
        Category categoryFoundByName = null;
        if (categories.size() > 0 && categories.size() < 2) {
            categoryFoundByName = categories.get(0);
        } else if (categories.size() > 1) {
            isMoreCategoriesInDatabase = true;
        }

        if (isMoreCategoriesInDatabase) {
            categoryList(Constants.CATEGORY_WAS_NOT_UPDATED + name + Constants.CATEGORY_NAME_ALREADY_EXIST_IN_DB);
        } else if (categoryFoundByName != null && !categoryFoundByName.getCategoryId().equals(categoryFoundById.getCategoryId())) {
            categoryList(Constants.CATEGORY_WAS_NOT_UPDATED + name + Constants.CATEGORY_NAME_ALREADY_EXIST_IN_DB);
        } else {
            Category newCategory = new Category(categoryId, name);
            categoryDAO.update(newCategory);

            categoryList(Constants.CATEGORY_WAS_UPDATED);
        }
    }

    public void deleteCategory() throws ServletException, IOException {
        Integer categoryId = Integer.valueOf(request.getParameter("id"));

        Category category = categoryDAO.get(categoryId);

        if (category != null) {
            categoryDAO.delete(categoryId);
            categoryList(Constants.CATEGORY_WAS_DELETED);
        } else {
            categoryList(Constants.COULD_NOT_FIND_CATEGORY_BY_ID + categoryId + Constants.DELETED_BY_ANOTHER_CATEGORY_ADMIN);
        }
    }
}
