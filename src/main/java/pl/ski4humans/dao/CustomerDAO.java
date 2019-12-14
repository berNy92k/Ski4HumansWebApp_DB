package pl.ski4humans.dao;

import pl.ski4humans.entity.Customer;

import javax.persistence.EntityManager;
import java.util.List;

public class CustomerDAO extends JpaDAO<Customer> implements GenericDAO<Customer> {
    public CustomerDAO(EntityManager entityManager) {
        super(entityManager);
    }

    public Customer create(Customer customer) {
        return super.create(customer);
    }

    public Customer update(Customer category) {
        return super.update(category);
    }

    public Customer get(Object id) {
        return super.find(Customer.class, id);
    }

    public void delete(Object id) {
        super.delete(Customer.class, id);
    }

    public List<Customer> listAll() {
        return super.findByNamedQueryWithoutParameters("Customer.findAll");
    }

    public long count() {
        return super.countByNamedQuery("Customer.countAll");
    }

    public List<Customer> findByEmail(String email) {
        return super.findByNamedQueryWithParameter("Customer.findByEmail", "email", email);
    }
}
