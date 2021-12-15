package project.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "receipt")
public class Order implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int Id;
	@Column(name = "create_date")
	@CreationTimestamp
	private Date createDate;
	@Column(name = "status")
	private String Status;
	@Column(name = "email")
	private String Email;
	@Column(name = "phone")
	private String Phone;
	@Column(name = "address")
	private String Address;
	@OneToMany(mappedBy = "order")
	List<OrderDetail> orderDetails;

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public Order(int id, Date createDate, String status, String email, String phone, String address,
			List<OrderDetail> orderDetails) {
		super();
		Id = id;
		this.createDate = createDate;
		Status = status;
		Email = email;
		Phone = phone;
		Address = address;
		this.orderDetails = orderDetails;
	}

	public Order() {
		super();
	}

}
