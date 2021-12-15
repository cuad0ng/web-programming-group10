package project.data;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import project.model.Product;

public class ProductDAO {
    public void update(Product product) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(product);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
	@SuppressWarnings("unchecked")
	public List<Product> searchByName(String name){
		
		Transaction transaction = null;
		List<Product> listProduct = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an object
			listProduct = session
				    .createQuery("from Product where Name like: name")
					   .setParameter("name", "%"+name + "%").list();
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return listProduct;

	}

	public void save(Product product) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			session.save(product);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	public void delete(int id) {

		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();

			// Delete a user object
			Product product = session.get(Product.class, id);
			if (product != null) {
				session.delete(product);
				System.out.println("product is deleted");
			}

			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	public Product getProduct(int id) {

		Transaction transaction = null;
		Product product = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an object
			product = session.get(Product.class, id);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return product;
	}

	@SuppressWarnings("unchecked")
	public List<Product> getAll() {
		Transaction transaction = null;
		List<Product> products = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an object

			// products = session.createQuery("FROM Product ORDER
			// BY").setMaxResults(4).getResultList();
			products = session.createQuery("FROM Product").getResultList();

			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return products;
	}

}
