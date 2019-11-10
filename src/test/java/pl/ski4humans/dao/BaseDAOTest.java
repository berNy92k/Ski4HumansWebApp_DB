package pl.ski4humans.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class BaseDAOTest {
    private static EntityManagerFactory entityManagerFactory;
    protected static EntityManager entityManager;

    protected static void entityManagerSetUp() {
        entityManagerFactory = Persistence.createEntityManagerFactory("Ski4HumansWebApp");
        entityManager = entityManagerFactory.createEntityManager();
    }

    protected static void close() {
        entityManager.close();
        entityManagerFactory.close();
    }

}
