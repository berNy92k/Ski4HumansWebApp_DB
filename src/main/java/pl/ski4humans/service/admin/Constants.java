package pl.ski4humans.service.admin;

public interface Constants {
    String NULL = null;

    // -------------- USER --------------
    // URL
    String USER_LIST_URL = "/admin/user_list.jsp";
    String USER_CREATE_URL = "/admin/user_create.jsp";
    String ADMIN_URL = "/admin/";
    String ADMIN_LOGIN_URL = "/admin/login";
    String ADMIN_LOGIN_URL_JSP = "/admin/login.jsp";

    // MESSAGES
    String NEW_USER_WAS_CREATED = "New user was created";
    String USER_WAS_UPDATED = "User was updated";
    String USER_WAS_NOT_UPDATED = "User was NOT updated. ";
    String USER_EMAIL_ALREADY_EXIST_IN_DB = " --> Email already exist in database";
    String COULD_NOT_FIND_USER_BY_ID = "Could not find user with ID: ";
    String USER_WAS_DELETED = "User was deleted";
    String USER_ADMIN_CAN_NOT_BE_DELETED = "The default admin user account cannot be deleted";
    String DELETED_BY_ANOTHER_USER_ADMIN = ", or it might have been deleted by another admin.";
    String USER_LOGIN_FAILED = "Login failed";


    // -------------- CATEGORY --------------
    // URL
    String CATEGORY_LIST_URL = "/admin/category_list.jsp";
    String CATEGORY_CREATE_URL = "/admin/category_create.jsp";

    // MESSAGES
    String NEW_CATEGORY_WAS_CREATED = "New category was created";
    String CATEGORY_WAS_UPDATED = "Category was updated";
    String CATEGORY_WAS_NOT_UPDATED = "Category was NOT updated. ";
    String COULD_NOT_FIND_CATEGORY_BY_ID = "Could not find category with ID: ";
    String CATEGORY_NAME_ALREADY_EXIST_IN_DB = " --> Name of category already exist in database";
    String DELETED_BY_ANOTHER_CATEGORY_ADMIN = ", or it might have been deleted by another admin.";
    String CATEGORY_WAS_DELETED = "Category was deleted";


    // -------------- xxx --------------
    // URL

    // MESSAGES
}
