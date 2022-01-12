package kh.spring.dto;

public class AreaListDTO {

	private String title;
	private String contentid;
	private String contenttypeid;
	private String addr1;
	private int areacode;
	private String cat1;
	private String cat3;
	private String firstimage;
	private int readcount;
	public AreaListDTO(String title, String contentid, String contenttypeid, String addr1, int areacode, String cat1,
			String cat3, String firstimage, int readcount) {
		this.title = title;
		this.contentid = contentid;
		this.contenttypeid = contenttypeid;
		this.addr1 = addr1;
		this.areacode = areacode;
		this.cat1 = cat1;
		this.cat3 = cat3;
		this.firstimage = firstimage;
		this.readcount = readcount;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContentid() {
		return contentid;
	}
	public void setContentid(String contentid) {
		this.contentid = contentid;
	}
	public String getContenttypeid() {
		return contenttypeid;
	}
	public void setContenttypeid(String contenttypeid) {
		this.contenttypeid = contenttypeid;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public int getAreacode() {
		return areacode;
	}
	public void setAreacode(int areacode) {
		this.areacode = areacode;
	}
	public String getCat1() {
		return cat1;
	}
	public void setCat1(String cat1) {
		this.cat1 = cat1;
	}
	public String getCat3() {
		return cat3;
	}
	public void setCat3(String cat3) {
		this.cat3 = cat3;
	}
	public String getFirstimage() {
		return firstimage;
	}
	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	
	
}
