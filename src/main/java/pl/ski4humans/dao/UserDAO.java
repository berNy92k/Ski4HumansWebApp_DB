package pl.ski4humans.dao;

import pl.ski4humans.entity.User;

import javax.persistence.EntityManager;
import java.util.List;

public class UserDAO extends JpaDAO<User> implements GenericDAO<User> {

    public UserDAO(EntityManager entityManager) {
        super(entityManager);
    }

    public User create(User user) {
        return super.create(user);
    }

    public User update(User user) {
        return super.update(user);
    }

    public User get(Object id) {
        return super.find(User.class, id);
    }

    public void delete(Object id) {

    }

    public List<User> listAll() {
        return null;
    }

    public long count() {
        return 0;
    }
}
