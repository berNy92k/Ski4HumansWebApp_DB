package pl.ski4humans.dao;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import pl.ski4humans.entity.Category;
import pl.ski4humans.entity.Equipment;
import pl.ski4humans.entity.Manufacturer;

import javax.persistence.PersistenceException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;

import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertNull;
import static junit.framework.TestCase.assertEquals;
import static junit.framework.TestCase.assertTrue;

public class EquipmentDAOTest extends BaseDAOTest {
    private static EquipmentDAO equipmentDAO;
    private static ManufacturerDAO manufacturerDAO;
    private static CategoryDAO categoryDAO;

    @BeforeClass
    public static void setUp() {
        entityManagerSetUp();

        equipmentDAO = new EquipmentDAO(entityManager);
        manufacturerDAO = new ManufacturerDAO(entityManager);
        categoryDAO = new CategoryDAO(entityManager);
    }

    @Test
    public void testCreateEquipment() {
        Equipment equipment = new Equipment();
        equipment.setName("Narty Head Supershape I.Magnum + Head PR 112");

        Manufacturer manufacturer = manufacturerDAO.get(2);
        equipment.setManufacturer(manufacturer);
        equipment.setShortDescription("ShortDesc");
        equipment.setLongDescription("LongDescLongDescLongDescLongDescLongDescLongDescLongDescLongDescLongDescLongDesc");

        // MEN, WOMAN or CHILD
        equipment.setSex("MAN");

        String urlToImage = "D:\\berNy\\JAVA_SDA\\3)_Projekty\\3)_Ski4Humans\\PicToTest\\narty-head-supershape-imagnum-head-prx-11.jpg";
        byte[] bytesImage = new byte[0];
        try {
            bytesImage = Files.readAllBytes(Paths.get(urlToImage));
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (bytesImage.length > 0) {
            equipment.setImage(bytesImage);
        }

        equipment.setPrice(1500f);
        equipment.setLengthOrSize("170");

        Category category = categoryDAO.get(1);
        equipment.setCategory(category);

        // current date
        equipment.setPublishDate(new Date());
        equipment.setLastUpdateTime(new Date());

        equipment = equipmentDAO.create(equipment);

        assertTrue(equipment.getEquipmentId() > 0);
    }

    @Test(expected = PersistenceException.class)
    public void testCreateEquipmentWithoutSetFields() {
        Equipment equipment = new Equipment();

        equipmentDAO.create(equipment);
    }

    @Test
    public void testUpdateEquipment() {
        Equipment equipment = new Equipment();
        equipment.setEquipmentId(1);
        equipment.setName("Narty Head Supershape I.Magnum + Head PR 11");

        Manufacturer manufacturer = manufacturerDAO.get(2);
        equipment.setManufacturer(manufacturer);
        equipment.setShortDescription("ShortDescEDIT");
        equipment.setLongDescription("LongDescLongDescLongDescLongDescLongDescLongDescLongDescLongDescLongDescLongDesc");

        // MEN, WOMAN or CHILD
        equipment.setSex("MEN");

        String urlToImage = "D:\\berNy\\JAVA_SDA\\3)_Projekty\\3)_Ski4Humans\\PicToTest\\narty-head-supershape-imagnum-head-prx-11.jpg";
        byte[] bytesImage = new byte[0];
        try {
            bytesImage = Files.readAllBytes(Paths.get(urlToImage));
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (bytesImage.length > 0) {
            equipment.setImage(bytesImage);
        }

        equipment.setPrice(1500f);
        equipment.setLengthOrSize("170");

        Category category = categoryDAO.get(8);
        equipment.setCategory(category);

        // current date
        equipment.setPublishDate(new Date());
        equipment.setLastUpdateTime(new Date());

        Equipment updateEquipment = equipmentDAO.update(equipment);

        assertEquals("ShortDescEDIT", updateEquipment.getShortDescription());
    }

    @Test(expected = PersistenceException.class)
    public void testUpdateEquipmentWithoutSetFields() {
        Equipment equipment = new Equipment();

        equipmentDAO.update(equipment);
    }

    @Test
    public void testGetEquipmentNotNull() {
        Integer equipmentId = 1;
        Equipment equipment = equipmentDAO.get(equipmentId);

        assertNotNull(equipment);
    }

    @Test
    public void testGetEquipmentNull() {
        Integer equipmentId = 3000;
        Equipment equipment = equipmentDAO.get(equipmentId);

        assertNull(equipment);
    }

    @Test
    public void testDeleteEquipment() {
        Integer equipmentId = 5;
        equipmentDAO.delete(equipmentId);

        Equipment deletedEquipment = equipmentDAO.get(equipmentId);

        assertNull(deletedEquipment);
    }

    @Test
    public void testListAllEquipment() {
        List<Equipment> equipments = equipmentDAO.listAll();
        int size = equipments.size();

        assertEquals(1, size);
    }

    @Test
    public void testCountEquipment() {
        long count = equipmentDAO.count();

        assertEquals(1, count);
    }

    @AfterClass
    public static void tearDown() {
        close();
    }
}
