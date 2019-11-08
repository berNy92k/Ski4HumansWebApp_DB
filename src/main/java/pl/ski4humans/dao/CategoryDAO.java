package pl.ski4humans.dao;

import pl.ski4humans.entity.Category;
import pl.ski4humans.entity.User;

import javax.persistence.EntityManager;
import java.util.List;

public class CategoryDAO extends JpaDAO<Category> implements GenericDAO<Category> {

    public CategoryDAO(EntityManager entityManager) {
        super(entityManager);
    }

    public Category create(Category category) {
        return super.create(category);
    }

    public Category update(Category category) {
        return super.update(category);
    }

    public Category get(Object id) {
        return super.find(Category.class, id);
    }

    public void delete(Object id) {
        super.delete(Category.class, id);
    }

    public List<Category> listAll() {
        return super.findByNamedQueryWithoutParameters("Category.findAll");
    }

    public long count() {
        return super.countByNamedQuery("Category.countAll");
    }

    public List<Category> findByName(String name) {
        return super.findByNamedQueryWithParameter("Category.findByName", "name", name);
    }
}
