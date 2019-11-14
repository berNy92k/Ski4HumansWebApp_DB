package pl.ski4humans.service.frontend;

public interface ConstantsFrontendPL {
    String NULL = null;

    // -------------- HOMEPAGE --------------
    // URL
    String HOMEPAGE_URL = "/homepage/index.jsp";

    // MESSAGES
    String SEARCH_BY_WORD = "Wyszukane po słowie";

    // -------------- MANUFACTURER --------------
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

}
