package kh.spring.dto;

import java.sql.Date;

public class DashboardDTO {

	private Date date; 
	private int visitor;
	private int user_n;
	private int plan;
	private int tour_board;
	private int com_board;
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getVisitor() {
		return visitor;
	}
	public void setVisitor(int visitor) {
		this.visitor = visitor;
	}
	public int getUser_n() {
		return user_n;
	}
	public void setUser_n(int user_n) {
		this.user_n = user_n;
	}
	public int getPlan() {
		return plan;
	}
	public void setPlan(int plan) {
		this.plan = plan;
	}
	public int getTour_board() {
		return tour_board;
	}
	public void setTour_board(int tour_board) {
		this.tour_board = tour_board;
	}
	public int getCom_board() {
		return com_board;
	}
	public void setCom_board(int com_board) {
		this.com_board = com_board;
	}
	public DashboardDTO() {
	}
	public DashboardDTO(Date date, int visitor, int user_n, int plan, int tour_board, int com_board) {
		this.date = date;
		this.visitor = visitor;
		this.user_n = user_n;
		this.plan = plan;
		this.tour_board = tour_board;
		this.com_board = com_board;
	}
	
	
}
