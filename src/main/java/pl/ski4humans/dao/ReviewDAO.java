package pl.ski4humans.dao;

import pl.ski4humans.entity.Review;

import javax.persistence.EntityManager;
import java.util.List;

public class ReviewDAO extends JpaDAO<Review> implements GenericDAO<Review> {

    public ReviewDAO(EntityManager entityManager) {
        super(entityManager);
    }

    @Override
    public Review create(Review review) {
        return super.create(review);
    }

    @Override
    public Review update(Review review) {
        return super.update(review);
    }

    @Override
    public Review get(Object id) {
        return super.find(Review.class, id);
    }

    @Override
    public void delete(Object id) {
        super.delete(Review.class, id);
    }

    @Override
    public List<Review> listAll() {
        return super.findByNamedQueryWithoutParameters("Review.findAll");
    }

    @Override
    public long count() {
        return super.countByNamedQuery("Review.countAll");
    }
}
