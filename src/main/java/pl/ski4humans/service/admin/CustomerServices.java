package pl.ski4humans.service.admin;

import pl.ski4humans.dao.CustomerDAO;
import pl.ski4humans.entity.Customer;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

public class CustomerServices {
  private final CustomerDAO customerDAO;
  private final HttpServletRequest request;
  private final HttpServletResponse response;

  public CustomerServices(final HttpServletRequest req, final HttpServletResponse resp) {
    this.request = req;
    this.response = resp;
    EntityManager entityManager = Persistence
        .createEntityManagerFactory("Ski4HumansWebApp")
        .createEntityManager();
    customerDAO = new CustomerDAO(entityManager);
  }

  public void customerList() throws ServletException, IOException {
    customerList(ConstantsAdminPL.NULL);
  }

  public void customerList(final String message) throws ServletException, IOException {
    final List<Customer> customers = customerDAO.listAll();

    request.setAttribute("customerList", customers);
    if (message != null) {
      request.setAttribute(ConstantsAdminPL.MESSAGE, message);
    }

    request
        .getRequestDispatcher(ConstantsAdminPL.Customer.CUSTOMER_LIST_URL)
        .forward(request, response);
  }

  public void viewEquipment() throws ServletException, IOException {
    final Integer customerId = Integer.valueOf(request.getParameter("id"));
    final Customer customer = customerDAO.get(customerId);

    if (customer != null) {
      request.setAttribute("customer", customer);
    }

    request
        .getRequestDispatcher(ConstantsAdminPL.Customer.CUSTOMER_VIEW_URL)
        .forward(request, response);
  }

  public void createCustomer() throws ServletException, IOException {
    final String email = request.getParameter("email");
    final String password = request.getParameter("password");
    final String firstName = request.getParameter("firstName");
    final String lastName = request.getParameter("lastName");
    final String street = request.getParameter("street");
    final String homeNumber = request.getParameter("homeNumber");
    final String city = request.getParameter("city");
    final String zipCode = request.getParameter("zipCode");
    final String country = request.getParameter("country");
    final String phone = request.getParameter("phone");
    final Date registerDate = new Date();

    final List<Customer> categories = customerDAO.findByEmail(email);

    if (categories.size() > 0) {
      customerList(email + ConstantsAdminPL.Customer.CUSTOMER_NAME_ALREADY_EXIST_IN_DB);
    } else {
      final Customer newCustomer = Customer.builder()
          .email(email)
          .password(password)
          .firstName(firstName)
          .lastName(lastName)
          .street(street)
          .homeNumber(homeNumber)
          .city(city)
          .zipCode(zipCode)
          .country(country)
          .phone(phone)
          .registerDate(registerDate)
          .build();

      customerDAO.create(newCustomer);
      customerList(ConstantsAdminPL.Customer.NEW_CUSTOMER_WAS_CREATED);
    }
  }

  public void editCustomer() throws ServletException, IOException {
    final Integer id = Integer.valueOf(request.getParameter("id"));
    final Customer customer = customerDAO.get(id);

    if (customer != null) {
      request.setAttribute("customer", customer);

      request
          .getRequestDispatcher(ConstantsAdminPL.Customer.CUSTOMER_CREATE_URL)
          .forward(request, response);
    } else {
      customerList(ConstantsAdminPL.Customer.COULD_NOT_FIND_CUSTOMER_BY_ID + id);
    }
  }

  public void updateCustomer() throws ServletException, IOException {
    final Integer customerId = Integer.valueOf(request.getParameter("customerId"));
    final String email = request.getParameter("email");
    final String password = request.getParameter("password");
    final String firstName = request.getParameter("firstName");
    final String lastName = request.getParameter("lastName");
    final String street = request.getParameter("street");
    final String homeNumber = request.getParameter("homeNumber");
    final String city = request.getParameter("city");
    final String zipCode = request.getParameter("zipCode");
    final String country = request.getParameter("country");
    final String phone = request.getParameter("phone");

    boolean isMoreCategoriesInDatabase = false;

    final Customer customerFoundById = customerDAO.get(customerId);

    final List<Customer> customers = customerDAO.findByEmail(email);
    Customer customerFoundByEmail = null;
    if (customers.size() == 1) {
      customerFoundByEmail = customers.get(0);
    } else if (customers.size() > 1) {
      isMoreCategoriesInDatabase = true;
    }

    if (isMoreCategoriesInDatabase) {

      customerList(ConstantsAdminPL.Customer.CUSTOMER_WAS_NOT_UPDATED
          + email + ConstantsAdminPL.Customer.CUSTOMER_NAME_ALREADY_EXIST_IN_DB);
    } else if (customerFoundByEmail != null
        && !customerFoundByEmail.getCustomerId().equals(customerFoundById.getCustomerId())) {

      customerList(ConstantsAdminPL.Customer.CUSTOMER_WAS_NOT_UPDATED
          + email + ConstantsAdminPL.Customer.CUSTOMER_NAME_ALREADY_EXIST_IN_DB);
    } else {

      final Customer newCustomer = Customer.builder()
          .customerId(customerId)
          .email(email)
          .password(password.length() == 0 ? customerFoundById.getPassword() : password)
          .firstName(firstName)
          .lastName(lastName)
          .street(street)
          .homeNumber(homeNumber)
          .city(city)
          .zipCode(zipCode)
          .country(country)
          .phone(phone)
          .registerDate(customerFoundById.getRegisterDate())
          .build();

      customerDAO.update(newCustomer);
      customerList(ConstantsAdminPL.Customer.CUSTOMER_WAS_UPDATED);
    }
  }

  public void deleteCustomer() throws ServletException, IOException {
    final Integer customerId = Integer.valueOf(request.getParameter("id"));

    final Customer customer = customerDAO.get(customerId);

    if (customer != null) {
      customerDAO.delete(customerId);
      customerList(ConstantsAdminPL.Customer.CUSTOMER_WAS_DELETED);
    } else {
      customerList(ConstantsAdminPL.Customer.COULD_NOT_FIND_CUSTOMER_BY_ID
          + customerId + ConstantsAdminPL.Customer.DELETED_BY_ANOTHER_CUSTOMER_ADMIN);
    }
  }
}
