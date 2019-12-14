package pl.ski4humans.service.admin;

import pl.ski4humans.dao.CustomerDAO;
import pl.ski4humans.entity.Customer;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

    public void customerList() throws ServletException, IOException {
        customerList(ConstantsPL.NULL);
    }

    public void customerList(String message) throws ServletException, IOException {
        List<Customer> customers = customerDAO.listAll();

        request.setAttribute("customerList", customers);
        if (message != null) {
            request.setAttribute(ConstantsPL.MESSAGE, message);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsPL.CUSTOMER_LIST_URL);
        requestDispatcher.forward(request, response);
    }

    public void viewEquipment() throws ServletException, IOException {
        Integer customerId = Integer.valueOf(request.getParameter("id"));
        Customer customer = customerDAO.get(customerId);

        if (customer != null) {
            request.setAttribute("customer", customer);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsPL.CUSTOMER_VIEW_URL);
        requestDispatcher.forward(request, response);
    }

    public void createCustomer() throws ServletException, IOException {
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

        List<Customer> categories = customerDAO.findByEmail(email);

        if (categories.size() > 0) {
            customerList(email + ConstantsPL.CUSTOMER_NAME_ALREADY_EXIST_IN_DB);
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
            customerList(ConstantsPL.NEW_CUSTOMER_WAS_CREATED);
        }
    }

    public void editCustomer() throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        Customer customer = customerDAO.get(id);

        if (customer != null) {
            request.setAttribute("customer", customer);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(ConstantsPL.CUSTOMER_CREATE_URL);
            requestDispatcher.forward(request, response);
        } else {
            customerList(ConstantsPL.COULD_NOT_FIND_CUSTOMER_BY_ID + id);
        }
    }

    public void updateCustomer() throws ServletException, IOException {
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
            customerList(ConstantsPL.CUSTOMER_WAS_NOT_UPDATED + email + ConstantsPL.CUSTOMER_NAME_ALREADY_EXIST_IN_DB);
        } else if (customerFoundByEmail != null && !customerFoundByEmail.getCustomerId().equals(customerFoundById.getCustomerId())) {
            customerList(ConstantsPL.CUSTOMER_WAS_NOT_UPDATED + email + ConstantsPL.CUSTOMER_NAME_ALREADY_EXIST_IN_DB);
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

            customerDAO.update(newCustomer);
            customerList(ConstantsPL.CUSTOMER_WAS_UPDATED);
        }
    }

    public void deleteCustomer() throws ServletException, IOException {
        Integer customerId = Integer.valueOf(request.getParameter("id"));

        Customer customer = customerDAO.get(customerId);

        if (customer != null) {
            customerDAO.delete(customerId);
            customerList(ConstantsPL.CUSTOMER_WAS_DELETED);
        } else {
            customerList(ConstantsPL.COULD_NOT_FIND_CUSTOMER_BY_ID + customerId + ConstantsPL.DELETED_BY_ANOTHER_CUSTOMER_ADMIN);
        }
    }
}
