package pl.ski4humans.service.admin;

import pl.ski4humans.dao.UserDAO;
import pl.ski4humans.entity.User;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class UserServices {
    private UserDAO userDAO;
    private HttpServletRequest request;
    private HttpServletResponse response;

    public UserServices(HttpServletRequest req, HttpServletResponse resp) {
        this.request = req;
        this.response = resp;
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ski4HumansWebApp");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        userDAO = new UserDAO(entityManager);
    }

    public void userList() throws ServletException, IOException {
        userList(null);
    }

    public void userList(String message) throws ServletException, IOException {
        List<User> userList = userDAO.listAll();

        request.setAttribute("userList", userList);
        if (message != null) {
            request.setAttribute("message", message);
        }

        String url = "/admin/user_list.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
        requestDispatcher.forward(request, response);
    }

    public void createUser() throws ServletException, IOException {
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String password = request.getParameter("password");

        List<User> emails = userDAO.findByEmail(email);

        if (emails.size() > 0) {
            userList(email + " --> Email already exist in database");
        } else {
            User newUser = new User(email, fullName, password);
            userDAO.create(newUser);
            userList("New user was created");
        }
    }

    public void editUser() throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        User user = userDAO.get(id);

        request.setAttribute("user", user);

        String url = "/admin/user_create.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
        requestDispatcher.forward(request, response);
    }

    public void updateUser() throws ServletException, IOException {
        Integer userId = Integer.valueOf(request.getParameter("userId"));
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String password = request.getParameter("password");

        boolean isMoreEmailsInDatabase = false;

        User userFoundById = userDAO.get(userId);

        List<User> emails = userDAO.findByEmail(email);
        User userFoundByEmail = null;
        if (emails.size() > 0 && emails.size() < 2) {
            userFoundByEmail = emails.get(0);
        } else if (emails.size() > 1) {
            isMoreEmailsInDatabase = true;
        }

        if (isMoreEmailsInDatabase) {
            userList("User was NOT updated. " + email + " --> Email already exist in database");
        } else if (userFoundByEmail != null && !userFoundByEmail.getUserId().equals(userFoundById.getUserId())) {
            userList("User was NOT updated. " + email + " --> Email already exist in database");
        } else {
            User user = new User(userId, email, fullName, password);
            userDAO.update(user);

            userList("User was updated");
        }
    }

    public void deleteUser() throws ServletException, IOException {
        Integer userId = Integer.valueOf(request.getParameter("id"));

        userDAO.delete(userId);
        userList("User was deleted");
    }
}
