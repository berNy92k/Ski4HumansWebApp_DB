package pl.ski4humans.dao;

import pl.ski4humans.entity.Equipment;

import javax.persistence.EntityManager;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EquipmentDAO extends JpaDAO<Equipment> implements GenericDAO<Equipment> {

    public EquipmentDAO(EntityManager entityManager) {
        super(entityManager);
    }

    public Equipment create(Equipment equipment) {
        return super.create(equipment);
    }

    public Equipment update(Equipment equipment) {
        return super.update(equipment);
    }

    public Equipment get(Object id) {
        return super.find(Equipment.class, id);
    }

    public void delete(Object id) {
        super.delete(Equipment.class, id);
    }

    public List<Equipment> listAll() {
        return super.findByNamedQueryWithoutParameters("Equipment.findAll");
    }

    public List<Equipment> findByName(String name) {
        return super.findByNamedQueryWithParameter("Equipment.findByName", "name", name);
    }

    public List<Equipment> listAllByCategory(int category) {
        return super.findByNamedQueryWithParameter("Equipment.findAllByCategory", "categoryID", category);
    }

    public List<Equipment> listAllByCategoryAndSex(int equipmentCategory, String equipmentSex) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("categoryID", equipmentCategory);
        parameters.put("sex", equipmentSex);

        return super.findByNamedQueryWithMapOfParameters("Equipment.findAllByCategoryAndSex", parameters);
    }

    public long count() {
        return super.countByNamedQuery("Equipment.countAll");
    }
}
