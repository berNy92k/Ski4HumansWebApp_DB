package pl.ski4humans.dao;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;
import java.util.Map;

public class JpaDAO<E> {
  protected EntityManager entityManager;

  public JpaDAO(final EntityManager entityManager) {
    this.entityManager = entityManager;
  }

  protected E create(final E entity) {
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

  protected E find(final Class<E> type, final Object id) {
    E entity = entityManager.find(type, id);
    if (entity != null) {
      entityManager.refresh(entity);
    }
    return entity;
  }

  protected void delete(final Class<E> type, final Object id) {
    entityManager.getTransaction().begin();

    final E reference = entityManager.getReference(type, id);
    entityManager.remove(reference);

    entityManager.getTransaction().commit();
  }

  protected long countByNamedQuery(final String query) {
    final Query namedQuery = entityManager.createNamedQuery(query);

    return (Long) namedQuery.getSingleResult();
  }

  protected List<E> findByNamedQueryWithoutParameters(final String query) {
    final Query namedQuery = entityManager.createNamedQuery(query);

    return (List<E>) namedQuery.getResultList();
  }

  protected List<E> findByNamedQueryWithParameter(final String query,
                                                  final String paramName,
                                                  final Object paramValue) {
    final Query namedQuery = entityManager.createNamedQuery(query);
    namedQuery.setParameter(paramName, paramValue);

    return (List<E>) namedQuery.getResultList();
  }

  protected List<E> findByNamedQueryWithMapOfParameters(final String query,
                                                        final Map<String, Object> parameters) {
    final Query namedQuery = entityManager.createNamedQuery(query);

    for (final Map.Entry<String, Object> stringStringEntry : parameters.entrySet()) {
      namedQuery.setParameter(stringStringEntry.getKey(), stringStringEntry.getValue());
    }

    return namedQuery.getResultList();
  }
}
