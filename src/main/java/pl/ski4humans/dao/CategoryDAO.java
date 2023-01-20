package pl.ski4humans.dao;

import pl.ski4humans.entity.Category;

import javax.persistence.EntityManager;
import java.util.List;

public class CategoryDAO extends JpaDAO<Category> implements GenericDAO<Category> {

  public CategoryDAO(final EntityManager entityManager) {
    super(entityManager);
  }

  public Category create(final Category category) {
    return super.create(category);
  }

  public Category update(final Category category) {
    return super.update(category);
  }

  public Category get(final Object id) {
    return super.find(Category.class, id);
  }

  public void delete(final Object id) {
    super.delete(Category.class, id);
  }

  public List<Category> listAll() {
    return super.findByNamedQueryWithoutParameters("Category.findAll");
  }

  public long count() {
    return super.countByNamedQuery("Category.countAll");
  }

  public List<Category> findByName(final String name) {
    return super.findByNamedQueryWithParameter("Category.findByName", "name", name);
  }
}
