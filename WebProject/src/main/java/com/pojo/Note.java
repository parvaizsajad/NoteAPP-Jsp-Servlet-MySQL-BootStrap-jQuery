package com.pojo;



public class Note {

	private int id;
	private String title;
	private String date;
	private String desc;
	private int userId;
	public Note() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Note(int id, String title, String date, String desc,int userId) {
		super();
		this.id = id;
		this.title = title;
		this.date = date;
		this.desc = desc;
		this.userId=userId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "Note [id=" + id + ", title=" + title + ", date=" + date + ", desc=" + desc + "userId="+userId+"]";
	}
	
	
}
