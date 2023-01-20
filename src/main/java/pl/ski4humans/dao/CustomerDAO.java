package pl.ski4humans.dao;

import pl.ski4humans.entity.Customer;

import javax.persistence.EntityManager;
import java.util.List;

public class CustomerDAO extends JpaDAO<Customer> implements GenericDAO<Customer> {
  public CustomerDAO(final EntityManager entityManager) {
    super(entityManager);
  }

  public Customer create(final Customer customer) {
    return super.create(customer);
  }

  public Customer update(final Customer category) {
    return super.update(category);
  }

  public Customer get(final Object id) {
    return super.find(Customer.class, id);
  }

  public void delete(final Object id) {
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
