package pl.ski4humans.dao;

import pl.ski4humans.entity.Order;

import javax.persistence.EntityManager;
import java.util.List;

public class OrderDAO extends JpaDAO<Order> implements GenericDAO<Order> {

    public OrderDAO(EntityManager entityManager) {
        super(entityManager);
    }

    @Override
    public Order create(Order order) {
        return super.create(order);
    }

    @Override
    public Order update(Order order) {
        return super.update(order);
    }

    @Override
    public Order get(Object id) {
        return super.find(Order.class, id);
    }

    @Override
    public void delete(Object id) {
        super.delete(Order.class, id);
    }

    @Override
    public List<Order> listAll() {
        return super.findByNamedQueryWithoutParameters("Order.findAll");
    }

    @Override
    public long count() {
        return super.countByNamedQuery("Order.countAll");
    }

    public List<Order> findOrderByCustomerId(String customerId) {
        return super.findByNamedQueryWithParameter("Order.findByCustomerId", "customerId", customerId);
    }
}
