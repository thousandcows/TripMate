package kh.spring.dto;

public class AreaDTO {
	private String name;
	private String category;
	private String location;
	private String lo_detail;
	private String phone;
	private String detail;
	private String homepage;
	private String photo;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getLo_detail() {
		return lo_detail;
	}
	public void setLo_detail(String lo_detail) {
		this.lo_detail = lo_detail;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public AreaDTO() {
		super();
	}
	public AreaDTO(String name, String category, String location, String lo_detail, String phone,
			String detail, String homepage, String photo) {
		super();
		this.name = name;
		this.category = category;
		this.location = location;
		this.lo_detail = lo_detail;
		this.phone = phone;
		this.detail = detail;
		this.homepage = homepage;
		this.photo = photo;
	}
	
}
