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
import javax.servlet.http.HttpSession;
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
        userList(Constants.NULL);
    }

    public void userList(String message) throws ServletException, IOException {
        List<User> userList = userDAO.listAll();

        request.setAttribute("userList", userList);
        if (message != null) {
            request.setAttribute("message", message);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(Constants.USER_LIST_URL);
        requestDispatcher.forward(request, response);
    }

    public void createUser() throws ServletException, IOException {
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String password = request.getParameter("password");

        List<User> emails = userDAO.findByEmail(email);

        if (emails.size() > 0) {
            userList(email + Constants.USER_EMAIL_ALREADY_EXIST_IN_DB);
        } else {
            User newUser = new User(email, fullName, password);
            userDAO.create(newUser);
            userList(Constants.NEW_USER_WAS_CREATED);
        }
    }

    public void editUser() throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        User user = userDAO.get(id);

        if (user != null) {
            request.setAttribute("user", user);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(Constants.USER_CREATE_URL);
            requestDispatcher.forward(request, response);
        } else {
            userList(Constants.COULD_NOT_FIND_USER_BY_ID + id);
        }
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
            userList(Constants.USER_WAS_NOT_UPDATED + email + Constants.USER_EMAIL_ALREADY_EXIST_IN_DB);
        } else if (userFoundByEmail != null && !userFoundByEmail.getUserId().equals(userFoundById.getUserId())) {
            userList(Constants.USER_WAS_NOT_UPDATED + email + Constants.USER_EMAIL_ALREADY_EXIST_IN_DB);
        } else {
            User user = new User(userId, email, fullName, password);
            userDAO.update(user);

            userList(Constants.USER_WAS_UPDATED);
        }
    }

    public void deleteUser() throws ServletException, IOException {
        Integer userId = Integer.valueOf(request.getParameter("id"));

        if (userId.equals(1)) {
            userList(Constants.USER_ADMIN_CAN_NOT_BE_DELETED);
        } else {
            User user = userDAO.get(userId);

            if (user != null) {
                userDAO.delete(userId);
                userList(Constants.USER_WAS_DELETED);
            } else {
                userList(Constants.COULD_NOT_FIND_USER_BY_ID + userId + Constants.DELETED_BY_ANOTHER_USER_ADMIN);
            }
        }
    }

    public void loginAsAdministrator() throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        boolean isCorrect = userDAO.checkLoginAndPassword(email, password);

        if (isCorrect) {
            HttpSession session = request.getSession();
            session.setAttribute("userEmail", email);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(Constants.ADMIN_URL);
            requestDispatcher.forward(request, response);
        } else {
            request.setAttribute("message", Constants.USER_LOGIN_FAILED);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(Constants.ADMIN_LOGIN_URL_JSP);
            requestDispatcher.forward(request, response);
        }
    }

    public void logoutAsAdministrator() throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("userEmail");

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(Constants.ADMIN_LOGIN_URL_JSP);
        requestDispatcher.forward(request, response);
    }
}
