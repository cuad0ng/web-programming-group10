package project.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "receipt_detail")
public class OrderDetail implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int Id;
	@Column(name = "quantity")
	private int Quantity;
	@Column(name = "price")
	private double Price;
	@ManyToOne
	private Order order;
	@OneToOne
	@JoinColumn(name = "product_id", referencedColumnName = "id")
	private Product product;

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return Quantity;
	}

	public void setQuantity(int quantity) {
		Quantity = quantity;
	}

	public double getPrice() {
		return Price;
	}

	public void setPrice(double price) {
		Price = price;
	}

	public OrderDetail(int id, Order order, Product product, int quantity, double price) {
		super();
		Id = id;
		this.order = order;
		this.product = product;
		Quantity = quantity;
		Price = price;
	}

	public OrderDetail() {
		super();
	}

}
