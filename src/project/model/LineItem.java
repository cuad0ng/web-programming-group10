package project.model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class LineItem implements Serializable{
	private Product product;
	private int quantity;
	
	public LineItem() {}
	
	
	public LineItem(Product product, int quantity) {
		super();
		this.product = product;
		this.quantity = quantity;
	}


	public void setProduct(Product p) {
		this.product = p;
	}
	
	public Product getProduct() {
		return this.product;
	}
	
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public int getQuantity() {
		return this.quantity;
	}
	
	public double getTotal() {
		double total = quantity * product.getPrice();
		return total;
	}
	


}
