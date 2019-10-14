package pl.ski4humans.dao;

import org.junit.BeforeClass;
import org.junit.Test;
import pl.ski4humans.entity.User;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;

import static junit.framework.TestCase.assertTrue;

public class UserDAOTest {
    private static EntityManagerFactory entityManagerFactory;
    private static EntityManager entityManager;
    private static UserDAO userDAO;

    @BeforeClass
    public static void setUp() {
        entityManagerFactory = Persistence.createEntityManagerFactory("Ski4HumansWebApp");
        entityManager = entityManagerFactory.createEntityManager();

        userDAO = new UserDAO(entityManager);
    }

    @Test
    public void testCreateUser() {
        User user = new User();
        user.setEmail("daw.b22er@gmail.com");
        user.setFullName("Dawid Ber22");
        user.setPassword("Asddds33as");

        user = userDAO.create(user);

        assertTrue(user.getUserId() > 0);
    }

    @Test(expected = PersistenceException.class)
    public void testCreateUserWithoutSetFields() {
        User user = new User();

        userDAO.create(user);
    }
}
