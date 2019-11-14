package pl.ski4humans.dao;

import pl.ski4humans.entity.User;

import javax.persistence.EntityManager;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        super.delete(User.class, id);
    }

    public List<User> listAll() {
        return super.findByNamedQueryWithoutParameters("User.findAll");
    }

    public List<User> findByEmail(String email) {
        return super.findByNamedQueryWithParameter("User.findByEmail", "email", email);
    }

    public boolean checkLoginAndPassword(String email, String password) {
        Map<String, Object> loginAndPassword = new HashMap<>();
        loginAndPassword.put("email", email);
        loginAndPassword.put("password", password);

        List<User> users = super.findByNamedQueryWithMapOfParameters("User.checkLoginAndPassword", loginAndPassword);

        if (users.size() == 1) {
            return true;
        }
        return false;
    }

    public long count() {
        return super.countByNamedQuery("User.countAll");
    }
}
