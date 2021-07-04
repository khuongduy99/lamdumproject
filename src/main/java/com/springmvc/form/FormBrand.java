package com.springmvc.form;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

public class FormBrand {
	private Long id;
	
	@NotEmpty(message = "\"Tên nhãn hàng\" không được để trống")
	@Length(min = 2 ,message = "\"Tên nhãn hàng\" phải ít nhất 2 ký tự. Thử lại")
	@Length(max = 100 ,message = "\"Tên nhãn hàng\" tối đa 100 ký tự. Thử lại")
	@Pattern(regexp = "[\\w ắằẳẵặăấầẩẫậâáàãảạđếềểễệêéèẻẽẹíìỉĩịốồổỗộôớờởỡợơóòõỏọứừửữựưúùủũụýỳỷỹỵẮẰẲẴẶĂẤẦẨẪẬÂÁÀÃẢẠĐẾỀỂỄỆÊÉÈẺẼẸÍÌỈĨỊỐỒỔỖỘÔỚỜỞỠỢƠÓÒÕỎỌỨỪỬỮỰƯÚÙỦŨỤÝỲỶỸỴ,.]*",message = "Không được chứa ký tự đặc biệt")
	private String name;
	
	private String status;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
}
