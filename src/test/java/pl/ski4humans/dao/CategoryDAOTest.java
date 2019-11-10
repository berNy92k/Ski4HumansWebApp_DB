package pl.ski4humans.dao;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import pl.ski4humans.entity.Category;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceException;
import java.util.List;

import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertNull;
import static junit.framework.TestCase.assertEquals;
import static junit.framework.TestCase.assertTrue;

public class CategoryDAOTest extends BaseDAOTest {
    private static EntityManagerFactory entityManagerFactory;
    private static EntityManager entityManager;
    private static CategoryDAO categoryDAO;

    @BeforeClass
    public static void setUp() {
        entityManagerSetUp();

        categoryDAO = new CategoryDAO(entityManager);
    }

    @Test
    public void testCreateCategory() {
        Category category = new Category();
        category.setName("TestCategory");

        category = categoryDAO.create(category);

        assertTrue(category.getCategoryId() > 0);
    }

    @Test(expected = PersistenceException.class)
    public void testCreateCategoryWithoutSetFields() {
        Category category = new Category();

        categoryDAO.create(category);
    }

    @Test
    public void testUpdateCategory() {
        Category category = new Category();
        category.setCategoryId(8);
        category.setName("TestCategoryUpdate");

        Category updateCategory = categoryDAO.update(category);

        assertEquals("TestCategoryUpdate", updateCategory.getName());
    }

    @Test(expected = PersistenceException.class)
    public void testUpdateCategoryWithoutSetFields() {
        Category category = new Category();

        categoryDAO.update(category);
    }

    @Test
    public void testGetCategoryNotNull() {
        Integer CategoryId = 8;
        Category category = categoryDAO.get(CategoryId);

        assertNotNull(category);
    }

    @Test
    public void testGetCategoryNull() {
        Integer CategoryId = 3000;
        Category category = categoryDAO.get(CategoryId);

        assertNull(category);
    }

    @Test
    public void testDeleteCategory() {
        Integer CategoryId = 1;
        categoryDAO.delete(CategoryId);

        Category deletedCategory = categoryDAO.get(CategoryId);

        assertNull(deletedCategory);
    }

    @Test
    public void testListAllCategory() {
        List<Category> categories = categoryDAO.listAll();
        int size = categories.size();

        assertEquals(2, size);
    }

    @Test
    public void testFindByName() {
        List<Category> byName = categoryDAO.findByName("Narty damskie3");
        String id = "3";

        assertEquals(id, byName.get(0).getCategoryId().toString());
    }

    @Test
    public void testCountCategory() {
        long count = categoryDAO.count();

        assertEquals(2, count);
    }

    @AfterClass
    public static void tearDown() {
        close();
    }
}
