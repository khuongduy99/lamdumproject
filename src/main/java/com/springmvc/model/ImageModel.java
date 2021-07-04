package com.springmvc.model;

public class ImageModel {
	private int id;
	private String name;
	private String url;
	private int totalPage;
	
	private int totalImage;
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	

	public int getTotalImage() {
		return totalImage;
	}

	public void setTotalImage(int totalImage) {
		this.totalImage = totalImage;
	}
	

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public ImageModel(int id, String name, String url, int totalImage, int totalPage) {
		super();
		this.id = id;
		this.name = name;
		this.url = url;
		this.totalImage = totalImage;
		this.totalPage = totalPage;
	}

}
