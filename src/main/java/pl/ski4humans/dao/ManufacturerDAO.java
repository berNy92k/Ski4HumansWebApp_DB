package pl.ski4humans.dao;

import pl.ski4humans.entity.Manufacturer;

import javax.persistence.EntityManager;
import java.util.List;

public class ManufacturerDAO extends JpaDAO<Manufacturer> implements GenericDAO<Manufacturer> {

    public ManufacturerDAO(EntityManager entityManager) {
        super(entityManager);
    }

    @Override
    public Manufacturer create(Manufacturer manufacturer) {
        return super.create(manufacturer);
    }

    @Override
    public Manufacturer update(Manufacturer manufacturer) {
        return super.update(manufacturer);
    }

    @Override
    public Manufacturer get(Object id) {
        return super.find(Manufacturer.class, id);
    }

    @Override
    public void delete(Object id) {
        super.delete(Manufacturer.class, id);
    }

    @Override
    public List<Manufacturer> listAll() {
        return super.findByNamedQueryWithoutParameters("Manufacturer.findAll");
    }

    @Override
    public long count() {
        return super.countByNamedQuery("Manufacturer.countAll");
    }

    public List<Manufacturer> findByManufacturerName(String manufacturerName) {
        return super.findByNamedQueryWithParameter("Manufacturer.findByManufacturerName", "manufacturerName", manufacturerName);
    }
}
