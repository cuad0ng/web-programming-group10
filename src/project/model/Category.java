package project.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "category")
public class Category implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int Id;
	@Column(name = "title")
	private String Title;
	@Column(name = "description")
	private String Description;
	@OneToMany(mappedBy="category")
	private List<Product> products = new ArrayList<>();
	
	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public Category(int id, String title, String description, List<Product> products) {
		super();
		Id = id;
		Title = title;
		Description = description;
		this.products = products;
	}

	

	public Category(String title, String description, List<Product> products) {
		super();
		Title = title;
		Description = description;
		this.products = products;
	}

	public Category() {
		super();
	}

}
