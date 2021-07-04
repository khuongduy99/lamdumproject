package com.springmvc.form;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

public class FormRegister {
	private Long id;
	
	@NotEmpty(message = "\"Họ tên\" không được để trống")
	private String fullname;
	
	@NotEmpty(message = "\"Tên đăng nhập\" không được để trống")
	private String username;
	
	@NotEmpty(message = "\"Email\" không được để trống")
	@Email(message = "Vui lòng nhập đúng định dạng Email")
	private String email;
	
	@NotEmpty(message = "\"Mật khẩu\" không được để trống")
	private String password;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@NotEmpty(message = "\"Số điện thoại\" không được để trống")
	private String phone;
	
	@NotEmpty(message = "\"Địa chỉ\" không được để trống")
	private String address;
}
