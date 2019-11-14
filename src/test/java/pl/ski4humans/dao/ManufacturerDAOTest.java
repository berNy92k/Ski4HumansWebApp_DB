package pl.ski4humans.dao;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import pl.ski4humans.entity.Manufacturer;

import javax.persistence.PersistenceException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertNull;
import static junit.framework.TestCase.assertEquals;
import static junit.framework.TestCase.assertTrue;

public class ManufacturerDAOTest extends BaseDAOTest {
    private static ManufacturerDAO manufacturerDAO;

    @BeforeClass
    public static void setUp() {
        entityManagerSetUp();

        manufacturerDAO = new ManufacturerDAO(entityManager);
    }

    @Test
    public void testCreateManufacturer() throws IOException {
        Manufacturer manufacturer = new Manufacturer();
        manufacturer.setManufacturerName("Nike");
        manufacturer.setDescription("Nike company");

        String pathToImage = "D:\\berNy\\JAVA_SDA\\3)_Projekty\\3)_Ski4Humans\\PicToTest\\nike-logo.png";
        byte[] imageByte = Files.readAllBytes(Paths.get(pathToImage));
        manufacturer.setImage(imageByte);

        manufacturer = manufacturerDAO.create(manufacturer);

        assertTrue(manufacturer.getManufacturerId() > 0);
    }

    @Test(expected = PersistenceException.class)
    public void testCreateManufacturerWithoutSetFields() {
        Manufacturer manufacturer = new Manufacturer();

        manufacturerDAO.create(manufacturer);
    }

    @Test
    public void testUpdateManufacturer() throws IOException {
        Manufacturer manufacturer = new Manufacturer();
        manufacturer.setManufacturerId(2);
        manufacturer.setManufacturerName("Reebok");
        manufacturer.setDescription("Reebok company");

        String pathToImage = "D:\\berNy\\JAVA_SDA\\3)_Projekty\\3)_Ski4Humans\\PicToTest\\nike-logo.png";
        byte[] imageByte = Files.readAllBytes(Paths.get(pathToImage));
        manufacturer.setImage(imageByte);

        Manufacturer updateManufacturer = manufacturerDAO.update(manufacturer);

        assertEquals("Reebok", updateManufacturer.getManufacturerName());
    }

    @Test(expected = PersistenceException.class)
    public void testUpdateManufacturerWithoutSetFields() {
        Manufacturer manufacturer = new Manufacturer();

        manufacturerDAO.update(manufacturer);
    }

    @Test
    public void testGetManufacturerNotNull() {
        Integer ManufacturerId = 1;
        Manufacturer manufacturer = manufacturerDAO.get(ManufacturerId);

        assertNotNull(manufacturer);
    }

    @Test
    public void testGetManufacturerNull() {
        Integer ManufacturerId = 3000;
        Manufacturer manufacturer = manufacturerDAO.get(ManufacturerId);

        assertNull(manufacturer);
    }

    @Test
    public void testDeleteManufacturer() {
        Integer ManufacturerId = 1;
        manufacturerDAO.delete(ManufacturerId);

        Manufacturer deletedManufacturer = manufacturerDAO.get(ManufacturerId);

        assertNull(deletedManufacturer);
    }

    @Test
    public void testListAllManufacturer() {
        List<Manufacturer> categories = manufacturerDAO.listAll();
        int size = categories.size();

        assertEquals(2, size);
    }

    @Test
    public void testCountManufacturer() {
        long count = manufacturerDAO.count();

        assertEquals(1, count);
    }

    @Test
    public void testFindByManufacturerName() {
        List<Manufacturer> reebok = manufacturerDAO.findByManufacturerName("Reebok");
        String manufacturerId = "2";

        assertEquals(manufacturerId, reebok.get(0).getManufacturerId().toString());
    }

    @AfterClass
    public static void tearDown() {
        close();
    }
}
