package project.model;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name = "user_table")
public class User implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int Id;
	@Column(name = "name")
	private String Name;
	@Column(name = "email")
	private String Email;
	@Column(name = "password")
	private String Password;
	@Column(name = "phone")
	private String Phone;
	@Column(name = "image")
	private String Image;
	@Column(name = "address")
	private String Address;
	@Column(name = "role")
	private String Role;

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

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public String getImage() {
		return Image;
	}

	public void setImage(String image) {
		Image = image;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getRole() {
		return Role;
	}

	public void setRole(String role) {
		Role = role;
	}

	public User(int id, String name, String email, String password, String phone, String image, String address,
			String role) {
		super();
		Id = id;
		Name = name;
		Email = email;
		Password = password;
		Phone = phone;
		Image = image;
		Address = address;
		Role = role;
	}

	public User(String name, String email, String password, String phone, String image, String address, String role) {
		super();
		Name = name;
		Email = email;
		Password = password;
		Phone = phone;
		Image = image;
		Address = address;
		Role = role;
	}

	public User(String name, String email, String password, String role) {
		super();
		Name = name;
		Email = email;
		Password = password;
		Role = role;
	}

	public User() {
		super();
	}

}
