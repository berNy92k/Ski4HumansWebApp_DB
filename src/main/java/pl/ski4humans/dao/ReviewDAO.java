package pl.ski4humans.dao;

import pl.ski4humans.entity.Review;

import javax.persistence.EntityManager;
import java.util.List;

public class ReviewDAO extends JpaDAO<Review> implements GenericDAO<Review> {

  public ReviewDAO(final EntityManager entityManager) {
    super(entityManager);
  }

  @Override
  public Review create(final Review review) {
    return super.create(review);
  }

  @Override
  public Review update(final Review review) {
    return super.update(review);
  }

  @Override
  public Review get(final Object id) {
    return super.find(Review.class, id);
  }

  @Override
  public void delete(final Object id) {
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

  public List<Review> findAllByEquipmentId(final int equipmentId) {
    return super.findByNamedQueryWithParameter("Review.findAllByEquipmentId", "equipmentId", equipmentId);
  }
}
