package pl.ski4humans.service.frontend;

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

  public CustomerServices(HttpServletRequest req, HttpServletResponse resp) {
    this.request = req;
    this.response = resp;
    EntityManager entityManager = Persistence
        .createEntityManagerFactory("Ski4HumansWebApp")
        .createEntityManager();
    customerDAO = new CustomerDAO(entityManager);
  }

  public void loginFormCustomer() throws ServletException, IOException {
    request
        .getRequestDispatcher(ConstantsFrontendPL.LoginRegister.LOGIN_FORM_PAGE)
        .forward(request, response);
  }

  public void loginAsCustomer() throws ServletException, IOException {
    final String email = request.getParameter("email");
    final String password = request.getParameter("password");

    final List<Customer> byEmail = customerDAO.findByEmail(email);
    if (byEmail != null && byEmail.size() > 0) {
      final Customer customer = byEmail.get(0);
      if (customer.getPassword().equals(password)) {
        request
            .getSession()
            .setAttribute(ConstantsFrontendPL.LoginRegister.LOGGED_CUSTOMER, customer);

        request
            .getRequestDispatcher(ConstantsFrontendPL.Homepage.HOMEPAGE_PAGE)
            .forward(request, response);
      } else {
        request
            .setAttribute(ConstantsFrontendPL.MESSAGE, ConstantsFrontendPL.LoginRegister.LOGIN_FAILED);
        request
            .getRequestDispatcher(ConstantsFrontendPL.LoginRegister.LOGIN_FORM_PAGE)
            .forward(request, response);
      }
    } else {
      request
          .setAttribute(ConstantsFrontendPL.MESSAGE, ConstantsFrontendPL.LoginRegister.LOGIN_FAILED);
      request
          .getRequestDispatcher(ConstantsFrontendPL.LoginRegister.LOGIN_FORM_PAGE)
          .forward(request, response);
    }
  }

  public void logoutCustomer() throws ServletException, IOException {
    request
        .getSession()
        .removeAttribute(ConstantsFrontendPL.LoginRegister.LOGGED_CUSTOMER);

    request
        .getRequestDispatcher(ConstantsFrontendPL.Homepage.HOMEPAGE_PAGE)
        .forward(request, response);
  }

  public void registerFormCustomer() throws ServletException, IOException {
    request
        .getRequestDispatcher(ConstantsFrontendPL.LoginRegister.REGISTER_FORM_PAGE)
        .forward(request, response);
  }

  public void registerCustomer() throws ServletException, IOException {
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

    final List<Customer> emailAlreadyExist = customerDAO.findByEmail(email);
    if (emailAlreadyExist.size() > 0) {
      request
          .setAttribute(ConstantsFrontendPL.MESSAGE, ConstantsFrontendPL.LoginRegister.REGISTER_FAILED);
      request
          .getRequestDispatcher(ConstantsFrontendPL.LoginRegister.REGISTER_FORM_PAGE)
          .forward(request, response);
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

      request
          .setAttribute(ConstantsFrontendPL.MESSAGE, ConstantsFrontendPL.LoginRegister.REGISTER_SUCCESS);
      request
          .getRequestDispatcher(ConstantsFrontendPL.LoginRegister.LOGIN_FORM_PAGE)
          .forward(request, response);
    }
  }

  public void myAccountViewCustomer() throws ServletException, IOException {
    myAccountViewCustomer(null);
  }

  public void myAccountViewCustomer(String message) throws ServletException, IOException {
    //TODO dodac zamowienia

    request
        .setAttribute(ConstantsFrontendPL.MESSAGE, message);

    request
        .getRequestDispatcher(ConstantsFrontendPL.MyAccount.MY_ACCOUNT_VIEW_URL)
        .forward(request, response);
  }

  public void myAccountEditCustomer() throws ServletException, IOException {
    request
        .getRequestDispatcher(ConstantsFrontendPL.MyAccount.MY_ACCOUNT_CREATE_URL)
        .forward(request, response);
  }

  public void myAccountUpdateCustomer() throws ServletException, IOException {
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

    final List<Customer> customers = customerDAO.findByEmail(email);
    Customer customerFoundByEmail = null;
    if (customers.size() == 1) {
      customerFoundByEmail = customers.get(0);
    } else if (customers.size() > 1) {
      isMoreCategoriesInDatabase = true;
    }

    final Customer customerFoundById = customerDAO.get(customerId);
    if (isMoreCategoriesInDatabase ||
        customerFoundByEmail != null && !customerFoundByEmail.getCustomerId().equals(customerFoundById.getCustomerId())) {

      myAccountViewCustomer(ConstantsFrontendPL.MyAccount.MY_ACCOUNT_CUSTOMER_WAS_NOT_UPDATED
          + email
          + ConstantsFrontendPL.MyAccount.MY_ACCOUNT_CUSTOMER_NAME_ALREADY_EXIST_IN_DB);
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

      final Customer customer = customerDAO.update(newCustomer);
      request
          .getSession()
          .setAttribute(ConstantsFrontendPL.LoginRegister.LOGGED_CUSTOMER, customer);

      myAccountViewCustomer(ConstantsFrontendPL.MyAccount.MY_ACCOUNT_CUSTOMER_WAS_UPDATED);
    }
  }
}
