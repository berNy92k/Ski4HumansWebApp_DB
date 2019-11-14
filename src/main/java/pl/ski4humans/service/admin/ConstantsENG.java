package pl.ski4humans.service.admin;

public interface ConstantsENG {
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
    String DELETED_BY_ANOTHER_USER_ADMIN = ", or it might have been deleted by another admin.";
    String USER_LOGIN_FAILED = "Login failed";
    String USER_ADMIN_CAN_NOT_BE_DELETED_SQL_ADMIN = "The default admin user account with id = 1 cannot be deleted (It can be update only by SQL Administrator)";
    String USER_ADMIN_CAN_NOT_BE_UPDATED_SQL_ADMIN = "User can not be updated. User with id = 1 is impossible to update (It can be update only by SQL Administrator)";



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
    String CATEGORY_CAN_NOT_BE_DELETED_SQL_ADMIN = "Category can not be delete. Categories with id 1,2,3,4,5,6,7 are impossible to delete (It can be delete only by SQL Administrator)";
    String CATEGORY_CAN_NOT_BE_UPDATED_SQL_ADMIN = "Category can not be updated. Categories with id 1,2,3,4,5,6,7 are impossible to update (It can be update only by SQL Administrator)";


    // -------------- MANUFACTURER --------------
    // URL
    String MANUFACTURER_LIST_URL = "/admin/manufacturer_list.jsp";
    String MANUFACTURER_CREATE_URL = "/admin/manufacturer_create.jsp";

    // MESSAGES
    String NEW_MANUFACTURER_WAS_CREATED = "New manufacturer was created";
    String NEW_MANUFACTURER_WAS_NOT_CREATED = "New manufacturer was not created";
    String MANUFACTURER_WAS_UPDATED = "Manufacturer was updated";
    String MANUFACTURER_WAS_NOT_UPDATED = "Manufacturer was NOT updated. ";
    String MANUFACTURER_ALREADY_EXIST_IN_DB = " --> Manufacturer already exist in database";
    String COULD_NOT_FIND_MANUFACTURER_BY_ID = "Could not find manufacturer with ID: ";
    String MANUFACTURER_WAS_DELETED = "Manufacturer was deleted";
    String DELETED_BY_ANOTHER_MANUFACTURER_ADMIN = ", or it might have been deleted by another admin.";


    // -------------- EQUIPMENT --------------
    // URL
    String EQUIPMENT_LIST_URL = "/admin/equipment_list.jsp";
    String EQUIPMENT_CREATE_URL = "/admin/equipment_create.jsp";
    String EQUIPMENT_VIEW_URL = "/admin/equipment_view.jsp";
    String EQUIPMENT_IS_CREATED_URL = "/admin/equipment_isCreated.jsp";

    // MESSAGES
    String NEW_EQUIPMENT_WAS_CREATED = "New equipment was created";
    String NEW_EQUIPMENT_WAS_NOT_CREATED = "New equipment was not created";
    String EQUIPMENT_WAS_UPDATED = "Equipment was updated";
    String EQUIPMENT_WAS_NOT_UPDATED = "Equipment was NOT updated. ";
    String EQUIPMENT_ALREADY_EXIST_IN_DB = " --> Equipment name already exist in database";
    String COULD_NOT_FIND_EQUIPMENT_BY_ID = "Could not find equipment with ID: ";
    String EQUIPMENT_WAS_DELETED = "Equipment was deleted";
    String DELETED_BY_ANOTHER_EQUIPMENT_ADMIN = ", or it might have been deleted by another admin.";
    String LACK_OF_EQUIPMENT_IN_DB = "Brak sprzętu w bazie.";

}
