package pl.ski4humans.dao;

import pl.ski4humans.entity.Equipment;

import javax.persistence.EntityManager;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EquipmentDAO extends JpaDAO<Equipment> implements GenericDAO<Equipment> {

  public EquipmentDAO(final EntityManager entityManager) {
    super(entityManager);
  }

  public Equipment create(final Equipment equipment) {
    return super.create(equipment);
  }

  public Equipment update(final Equipment equipment) {
    return super.update(equipment);
  }

  public Equipment get(final Object id) {
    return super.find(Equipment.class, id);
  }

  public void delete(final Object id) {
    super.delete(Equipment.class, id);
  }

  public List<Equipment> listAll() {
    return super.findByNamedQueryWithoutParameters("Equipment.findAll");
  }

  public List<Equipment> findByName(final String name) {
    return super.findByNamedQueryWithParameter("Equipment.findByName", "name", name);
  }

  public List<Equipment> listAllByCategory(final int category) {
    return super.findByNamedQueryWithParameter("Equipment.findAllByCategory", "categoryID", category);
  }

  public List<Equipment> listAllByCategoryAndSex(final int equipmentCategory, final String equipmentSex) {
    final Map<String, Object> parameters = new HashMap<>();
    parameters.put("categoryID", equipmentCategory);
    parameters.put("sex", equipmentSex);

    return super.findByNamedQueryWithMapOfParameters("Equipment.findAllByCategoryAndSex", parameters);
  }

  public long count() {
    return super.countByNamedQuery("Equipment.countAll");
  }

  public List<Equipment> listAllByNameOrDescription(final String search) {
    final Map<String, Object> parameters = new HashMap<>();
    parameters.put("name", search);
    parameters.put("shortDescription", search);
    parameters.put("longDescription", search);

    return super.findByNamedQueryWithMapOfParameters("Equipment.findAllByNameOrDescription", parameters);
  }
}
