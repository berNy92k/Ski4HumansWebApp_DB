package pl.ski4humans.dao;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

public class JpaDAO<E> {
    protected EntityManager entityManager;

    public JpaDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    protected E create(E entity) {
        entityManager.getTransaction().begin();

        entityManager.persist(entity);
        entityManager.flush();
        entityManager.refresh(entity);

        entityManager.getTransaction().commit();

        return entity;
    }

    protected E update(E entity) {
        entityManager.getTransaction().begin();
        entity = entityManager.merge(entity);
        entityManager.getTransaction().commit();

        return entity;
    }

    protected E find(Class<E> type, Object id) {
        E entity = entityManager.find(type, id);
        entityManager.refresh(entity);
        return entity;
    }

    protected void delete(Class<E> type, Object id) {
        entityManager.getTransaction().begin();

        E reference = entityManager.getReference(type, id);
        entityManager.remove(reference);

        entityManager.getTransaction().commit();
    }

    protected long countByNamedQuery(String query) {
        Query namedQuery = entityManager.createNamedQuery(query);

        return (Long) namedQuery.getSingleResult();
    }

    protected List<E> findByNamedQueryWithoutParameters(String query) {
        Query namedQuery = entityManager.createNamedQuery(query);

        return (List<E>) namedQuery.getResultList();
    }

    protected List<E> findByNamedQueryWithParameter(String query,
                                                    String paramName,
                                                    String paramValue) {
        Query namedQuery = entityManager.createNamedQuery(query);
        namedQuery.setParameter(paramName, paramValue);

        return (List<E>) namedQuery.getResultList();
    }
}
