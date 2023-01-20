package pl.ski4humans.service.admin;

import pl.ski4humans.dao.UserDAO;
import pl.ski4humans.entity.User;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class UserServices {

  private final UserDAO userDAO;
  private final HttpServletRequest request;
  private final HttpServletResponse response;

  public UserServices(final HttpServletRequest req, final HttpServletResponse resp) {
    this.request = req;
    this.response = resp;
    EntityManager entityManager = Persistence
        .createEntityManagerFactory("Ski4HumansWebApp")
        .createEntityManager();
    userDAO = new UserDAO(entityManager);
  }

  public void userList() throws ServletException, IOException {
    userList(ConstantsAdminPL.NULL);
  }

  public void userList(final String message) throws ServletException, IOException {
    final List<User> users = userDAO.listAll();

    request.setAttribute("userList", users);
    if (message != null) {
      request.setAttribute(ConstantsAdminPL.MESSAGE, message);
    }

    request
        .getRequestDispatcher(ConstantsAdminPL.User.USER_LIST_URL)
        .forward(request, response);
  }

  public void createUser() throws ServletException, IOException {
    final String email = request.getParameter("email");

    final List<User> emails = userDAO.findByEmail(email);
    if (emails.size() > 0) {
      userList(email + ConstantsAdminPL.User.USER_EMAIL_ALREADY_EXIST_IN_DB);
    } else {
      final String fullName = request.getParameter("fullName");
      final String password = request.getParameter("password");

      final User newUser = User.builder()
          .email(email)
          .fullName(fullName)
          .password(password)
          .build();

      userDAO.create(newUser);
      userList(ConstantsAdminPL.User.NEW_USER_WAS_CREATED);
    }
  }

  public void editUser() throws ServletException, IOException {
    final int id = Integer.parseInt(request.getParameter("id"));
    final User user = userDAO.get(id);

    if (id == 1) {
      userList(ConstantsAdminPL.User.USER_ADMIN_CAN_NOT_BE_UPDATED_SQL_ADMIN);
    } else if (user != null) {
      request.setAttribute("user", user);

      request
          .getRequestDispatcher(ConstantsAdminPL.User.USER_CREATE_URL)
          .forward(request, response);
    } else {
      userList(ConstantsAdminPL.User.COULD_NOT_FIND_USER_BY_ID + id);
    }
  }

  public void updateUser() throws ServletException, IOException {
    final Integer userId = Integer.valueOf(request.getParameter("userId"));
    final String email = request.getParameter("email");
    final String fullName = request.getParameter("fullName");
    final String password = request.getParameter("password");

    boolean isMoreEmailsInDatabase = false;

    final List<User> emails = userDAO.findByEmail(email);
    User userFoundByEmail = null;
    if (emails.size() == 1) {
      userFoundByEmail = emails.get(0);
    } else if (emails.size() > 1) {
      isMoreEmailsInDatabase = true;
    }

    final User userFoundById = userDAO.get(userId);
    if (isMoreEmailsInDatabase) {

      userList(ConstantsAdminPL.User.USER_WAS_NOT_UPDATED
          + email + ConstantsAdminPL.User.USER_EMAIL_ALREADY_EXIST_IN_DB);
    } else if (userFoundByEmail != null
        && !userFoundByEmail.getUserId().equals(userFoundById.getUserId())) {

      userList(ConstantsAdminPL.User.USER_WAS_NOT_UPDATED
          + email + ConstantsAdminPL.User.USER_EMAIL_ALREADY_EXIST_IN_DB);
    } else {

      final User user = User.builder()
          .userId(userId)
          .email(email)
          .fullName(fullName)
          .password(password)
          .build();

      userDAO.update(user);
      userList(ConstantsAdminPL.User.USER_WAS_UPDATED);
    }
  }

  public void deleteUser() throws ServletException, IOException {
    final Integer userId = Integer.valueOf(request.getParameter("id"));

    if (userId.equals(1)) {
      userList(ConstantsAdminPL.User.USER_ADMIN_CAN_NOT_BE_DELETED_SQL_ADMIN);
    } else {
      final User user = userDAO.get(userId);

      if (user != null) {
        userDAO.delete(userId);
        userList(ConstantsAdminPL.User.USER_WAS_DELETED);
      } else {
        userList(ConstantsAdminPL.User.COULD_NOT_FIND_USER_BY_ID
            + userId + ConstantsAdminPL.User.DELETED_BY_ANOTHER_USER_ADMIN);
      }
    }
  }

  public void loginAsAdministrator() throws ServletException, IOException {
    final String email = request.getParameter("email");
    final String password = request.getParameter("password");

    final boolean isCorrect = userDAO.checkLoginAndPassword(email, password);
    if (isCorrect) {
      request
          .getSession()
          .setAttribute(ConstantsAdminPL.LOGGED_USER, email);

      request
          .getRequestDispatcher(ConstantsAdminPL.User.ADMIN_URL)
          .forward(request, response);
    } else {
      request.setAttribute(ConstantsAdminPL.MESSAGE, ConstantsAdminPL.User.USER_LOGIN_FAILED);

      request
          .getRequestDispatcher(ConstantsAdminPL.User.ADMIN_LOGIN_URL_JSP)
          .forward(request, response);
    }
  }

  public void logoutAsAdministrator() throws ServletException, IOException {
    request
        .getSession()
        .removeAttribute(ConstantsAdminPL.LOGGED_USER);

    request
        .getRequestDispatcher(ConstantsAdminPL.User.ADMIN_LOGIN_URL_JSP)
        .forward(request, response);
  }
}
