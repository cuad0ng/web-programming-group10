package project.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int Id;
	@Column(name = "name")
	private String Name;
	@Column(name = "description")
	private String Description;
	@Column(name = "image")
	private String Image;
	@Column(name = "price")
	private double Price;

	@Column(name = "quantity")
	private int Quantity;
	@ManyToOne
	private Category category;
	@OneToOne(mappedBy = "product")
	private OrderDetail orderDetail;

	public OrderDetail getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(OrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public String getImage() {
		return Image;
	}

	public void setImage(String image) {
		Image = image;
	}

	public double getPrice() {
		return Price;
	}

	public void setPrice(double price) {
		Price = price;
	}

	public int getQuantity() {
		return Quantity;
	}

	public void setQuantity(int quantity) {
		Quantity = quantity;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Product(int id, String name, String description, String image, double price, int quantity, Category category,
			OrderDetail orderDetail) {
		super();
		Id = id;
		Name = name;
		Description = description;
		Image = image;
		Price = price;

		Quantity = quantity;
		this.category = category;
		this.orderDetail = orderDetail;
	}

	public Product() {
		super();
	}

}
