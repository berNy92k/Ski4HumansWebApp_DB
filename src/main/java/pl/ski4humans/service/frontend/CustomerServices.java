package pl.ski4humans.service.frontend;

import pl.ski4humans.dao.CustomerDAO;
import pl.ski4humans.entity.Customer;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

public class CustomerServices {
    private CustomerDAO customerDAO;
    private HttpServletRequest request;
    private HttpServletResponse response;

    public CustomerServices(HttpServletRequest req, HttpServletResponse resp) {
        this.request = req;
        this.response = resp;
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Ski4HumansWebApp");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        customerDAO = new CustomerDAO(entityManager);
    }

    public void loginFormCustomer() throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.LOGIN_FORM_PAGE);
        requestDispatcher.forward(request, response);
    }

    public void loginAsCustomer() throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        List<Customer> byEmail = customerDAO.findByEmail(email);
        if (byEmail != null && byEmail.size() > 0) {
            Customer customer = byEmail.get(0);
            if (customer.getPassword().equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute(ConstantsFrontendPL.LOGGED_CUSTOMER, customer);

                RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.HOMEPAGE_PAGE);
                requestDispatcher.forward(request, response);
            } else {
                request.setAttribute(ConstantsFrontendPL.MESSAGE, ConstantsFrontendPL.LOGIN_FAILED);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.LOGIN_FORM_PAGE);
                requestDispatcher.forward(request, response);
            }
        } else {
            request.setAttribute(ConstantsFrontendPL.MESSAGE, ConstantsFrontendPL.LOGIN_FAILED);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.LOGIN_FORM_PAGE);
            requestDispatcher.forward(request, response);
        }
    }

    public void logoutCustomer() throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute(ConstantsFrontendPL.LOGGED_CUSTOMER);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.HOMEPAGE_PAGE);
        requestDispatcher.forward(request, response);
    }

    public void registerFormCustomer() throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.REGISTER_FORM_PAGE);
        requestDispatcher.forward(request, response);
    }

    public void registerCustomer() throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String street = request.getParameter("street");
        String homeNumber = request.getParameter("homeNumber");
        String city = request.getParameter("city");
        String zipCode = request.getParameter("zipCode");
        String country = request.getParameter("country");
        String phone = request.getParameter("phone");
        Date registerDate = new Date();

        List<Customer> emailAlreadyExist = customerDAO.findByEmail(email);

        if (emailAlreadyExist.size() > 0) {
            request.setAttribute(ConstantsFrontendPL.MESSAGE, ConstantsFrontendPL.REGISTER_FAILED);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.REGISTER_FORM_PAGE);
            requestDispatcher.forward(request, response);
        } else {
            Customer newCustomer = new Customer();
            newCustomer.setEmail(email);
            newCustomer.setPassword(password);
            newCustomer.setFirstName(firstName);
            newCustomer.setLastName(lastName);
            newCustomer.setStreet(street);
            newCustomer.setHomeNumber(homeNumber);
            newCustomer.setCity(city);
            newCustomer.setZipCode(zipCode);
            newCustomer.setCountry(country);
            newCustomer.setPhone(phone);
            newCustomer.setRegisterDate(registerDate);
            customerDAO.create(newCustomer);

            request.setAttribute(ConstantsFrontendPL.MESSAGE, ConstantsFrontendPL.REGISTER_SUCCESS);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.LOGIN_FORM_PAGE);
            requestDispatcher.forward(request, response);
        }
    }

    public void myAccountViewCustomer() throws ServletException, IOException {
        myAccountViewCustomer(null);
    }

    public void myAccountViewCustomer(String message) throws ServletException, IOException {
        //TODO dodac zamowienia

        request.setAttribute(ConstantsFrontendPL.MESSAGE, message);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.MY_ACCOUNT_VIEW_URL);
        requestDispatcher.forward(request, response);
    }

    public void myAccountEditCustomer() throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsFrontendPL.MY_ACCOUNT_CREATE_URL);
        requestDispatcher.forward(request, response);
    }

    public void myAccountUpdateCustomer() throws ServletException, IOException {
        Integer categoryId = Integer.valueOf(request.getParameter("customerId"));
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String street = request.getParameter("street");
        String homeNumber = request.getParameter("homeNumber");
        String city = request.getParameter("city");
        String zipCode = request.getParameter("zipCode");
        String country = request.getParameter("country");
        String phone = request.getParameter("phone");

        boolean isMoreCategoriesInDatabase = false;

        Customer customerFoundById = customerDAO.get(categoryId);

        List<Customer> customers = customerDAO.findByEmail(email);
        Customer customerFoundByEmail = null;
        if (customers.size() > 0 && customers.size() < 2) {
            customerFoundByEmail = customers.get(0);
        } else if (customers.size() > 1) {
            isMoreCategoriesInDatabase = true;
        }

        if (isMoreCategoriesInDatabase) {
            myAccountViewCustomer(ConstantsFrontendPL.MY_ACCOUNT_CUSTOMER_WAS_NOT_UPDATED + email + ConstantsFrontendPL.MY_ACCOUNT_CUSTOMER_NAME_ALREADY_EXIST_IN_DB);
        } else if (customerFoundByEmail != null && !customerFoundByEmail.getCustomerId().equals(customerFoundById.getCustomerId())) {
            myAccountViewCustomer(ConstantsFrontendPL.MY_ACCOUNT_CUSTOMER_WAS_NOT_UPDATED + email + ConstantsFrontendPL.MY_ACCOUNT_CUSTOMER_NAME_ALREADY_EXIST_IN_DB);
        } else {
            Customer newCustomer = new Customer();
            newCustomer.setCustomerId(categoryId);
            newCustomer.setEmail(email);
            if (password.length() == 0) {
                newCustomer.setPassword(customerFoundById.getPassword());
            } else {
                newCustomer.setPassword(password);
            }
            newCustomer.setFirstName(firstName);
            newCustomer.setLastName(lastName);
            newCustomer.setStreet(street);
            newCustomer.setHomeNumber(homeNumber);
            newCustomer.setCity(city);
            newCustomer.setZipCode(zipCode);
            newCustomer.setCountry(country);
            newCustomer.setPhone(phone);
            newCustomer.setRegisterDate(customerFoundById.getRegisterDate());
            Customer customer = customerDAO.update(newCustomer);

            HttpSession session = request.getSession();
            session.setAttribute(ConstantsFrontendPL.LOGGED_CUSTOMER, customer);

            myAccountViewCustomer(ConstantsFrontendPL.MY_ACCOUNT_CUSTOMER_WAS_UPDATED);
        }
    }
}
