package pl.ski4humans.dao;

import pl.ski4humans.entity.User;

import javax.persistence.EntityManager;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserDAO extends JpaDAO<User> implements GenericDAO<User> {

  public UserDAO(final EntityManager entityManager) {
    super(entityManager);
  }

  public User create(final User user) {
    return super.create(user);
  }

  public User update(final User user) {
    return super.update(user);
  }

  public User get(final Object id) {
    return super.find(User.class, id);
  }

  public void delete(final Object id) {
    super.delete(User.class, id);
  }

  public List<User> listAll() {
    return super.findByNamedQueryWithoutParameters("User.findAll");
  }

  public List<User> findByEmail(final String email) {
    return super.findByNamedQueryWithParameter("User.findByEmail", "email", email);
  }

  public boolean checkLoginAndPassword(final String email, final String password) {
    final Map<String, Object> loginAndPassword = new HashMap<>();
    loginAndPassword.put("email", email);
    loginAndPassword.put("password", password);

    final List<User> users =
        super.findByNamedQueryWithMapOfParameters("User.checkLoginAndPassword", loginAndPassword);

    return users.size() == 1;
  }

  public long count() {
    return super.countByNamedQuery("User.countAll");
  }
}
