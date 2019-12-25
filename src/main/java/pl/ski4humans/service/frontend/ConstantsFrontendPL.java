package pl.ski4humans.service.frontend;

public interface ConstantsFrontendPL {
    String NULL = null;

    String MESSAGE = "message";

    // ---------- LOGIN / REGISTER ----------
    String LOGIN_FORM_PAGE = "/homepage/logIn.jsp";
    String REGISTER_FORM_PAGE = "/homepage/register.jsp";
    String LOGGED_CUSTOMER = "customerLogged";
    String LOGIN_FAILED = "Zły email bądź hasło. Spróbuj ponownie";

    String REGISTER_SUCCESS = "Rejestracja zakończona sukcesem. Zaloguj się.";
    String REGISTER_FAILED = "Rejestracja nie zakończyła się sukcesem. Email istnieje w bazie.";

    // -------------- HOMEPAGE --------------
    // URL
    String HOMEPAGE_URL = "/homepage/index.jsp";
    String HOMEPAGE_PAGE = "../";

    // MESSAGES
    String SEARCH_BY_WORD = "Wyszukane po słowie";

    // ------------- MANUFACTURER -------------
    // URL
    String MANUFACTURER_LIST_URL = "/homepage/manufacturer_list.jsp";

    // MESSAGES
    String LACK_OF_MANUFACTURER_IN_DB = "Brak informacji o producencie sprzętu - zapraszamy wkrótce";

    // -------------- EQUIPMENT --------------
    // URL
    String EQUIPMENT_LIST_URL = "/homepage/equipment_list.jsp";
    String EQUIPMENT_VIEW_URL = "/homepage/equipment_view.jsp";

    // MESSAGES
    String LACK_OF_EQUIPMENT_IN_DB = "Brak sprzętu w bazie - zapraszamy wkrótce";

    // --------------- REVIEW ---------------
    // URL
    String REVIEW_HOMEPAGE_CREATE_URL = "/homepage/review_create.jsp";

    // MESSAGES

    // --------------- SHOPPING CART ---------------
    // URL
    String SHOPPING_CART_HOMEPAGE_URL = "/homepage/shoppingCart.jsp";

    // MESSAGES
    String SHOPPING_CART_EQUIPMENT_WAS_ADDED = "Dodano nowy sprzęt do koszyka";
    String SHOPPING_CART_EQUIPMENT_WAS_DELETED = "Usunięto sprzęt z koszyka";
    String SHOPPING_CART_EQUIPMENT_WAS_UPDATED = "Dokonano aktualizacji sprzętu z koszyka - proszę o weryfikację ilości oraz kwoty";
    String SHOPPING_CART_EQUIPMENT_WAS_CLEARED = "Wyczyszczono koszyk z zakupami";
}
