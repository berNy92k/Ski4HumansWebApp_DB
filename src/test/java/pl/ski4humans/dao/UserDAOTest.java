package pl.ski4humans.dao;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import pl.ski4humans.entity.User;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertNull;
import static junit.framework.TestCase.assertEquals;
import static junit.framework.TestCase.assertTrue;

public class UserDAOTest extends BaseDAOTest {
    private static EntityManagerFactory entityManagerFactory;
    private static EntityManager entityManager;
    private static UserDAO userDAO;

    @BeforeClass
    public static void setUp() {
        entityManagerSetUp();

        userDAO = new UserDAO(entityManager);
    }

    @Test
    public void testCreateUser() {
        User user = new User();
        user.setEmail("test@gmail.com");
        user.setFullName("Test Men");
        user.setPassword("test");

        user = userDAO.create(user);

        assertTrue(user.getUserId() > 0);
    }

    @Test(expected = PersistenceException.class)
    public void testCreateUserWithoutSetFields() {
        User user = new User();

        userDAO.create(user);
    }

    @Test
    public void testUpdateUser() {
        User user = new User();
        user.setUserId(2014);
        user.setEmail("test@gmail.com");
        user.setFullName("Update test Men");
        user.setPassword("test");

        User updateUser = userDAO.update(user);

        assertEquals("Update test Men", updateUser.getFullName());
    }

    @Test(expected = PersistenceException.class)
    public void testUpdateUserWithoutSetFields() {
        User user = new User();

        userDAO.update(user);
    }

    @Test
    public void testGetUserNotNull() {
        Integer userId = 2014;
        User user = userDAO.get(userId);

        assertNotNull(user);
    }

    @Test
    public void testGetUserNull() {
        Integer userId = 3000;
        User user = userDAO.get(userId);

        assertNull(user);
    }

    @Test
    public void testDeleteUser() {
        Integer userId = 1007;
        userDAO.delete(userId);

        User deletedUser = userDAO.get(userId);

        assertNull(deletedUser);
    }

    @Test
    public void testListAllUser() {
        List<User> users = userDAO.listAll();
        int size = users.size();

        assertEquals(5, size);
    }

    @Test
    public void testFindByEmailUser() {
        List<User> byEmail = userDAO.findByEmail("ad@wp.pl");
        String userId = "1006";

        assertEquals(userId, byEmail.get(0).getUserId().toString());
    }

    @Test
    public void testCheckLoginAndPasswordUser() {
        boolean admin = userDAO.checkLoginAndPassword("admin@wp.pl", "admin");

        assertTrue(admin);
    }

    @Test
    public void testCheckLoginAndPasswordUser2() {
        Map<String, String> loginAndPassword = new HashMap<>();
        loginAndPassword.put("email", "admin@wp.pl");
        loginAndPassword.put("password", "admin");

        List<User> byNamedQueryWithMapOfParameters = userDAO.findByNamedQueryWithMapOfParameters("User.checkLoginAndPassword", loginAndPassword);

        assertEquals(1, byNamedQueryWithMapOfParameters.size());
    }

    @Test
    public void testCountUser() {
        long count = userDAO.count();

        assertEquals(5, count);
    }

    @AfterClass
    public static void tearDown() {
        close();
    }
}
