package com.fabianlopez.mainscopetest.entities;

public class Contact {
	private Integer idContact;
	private String name;
	private String email;
	private String phone;
	private String department;
	private Integer idClient;
	
	public Contact() {
		
	}
	
	public Contact(String name, String email, String phone, String department, Integer idClient) {
		super();
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.department = department;
		this.idClient = idClient;
	}
	
	public Contact(Integer idContact, String name, String email, String phone, String department) {
		super();
		this.idContact = idContact;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.department = department;
	}
	
	public Integer getIdContact() {
		return idContact;
	}
	public void setIdContact(Integer idContact) {
		this.idContact = idContact;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public Integer getIdClient() {
		return idClient;
	}
	public void setIdClient(Integer idClient) {
		this.idClient = idClient;
	}
	
	public String toSqlString() {
		return "null"+",'"+this.name+"',"+"'"+this.email+"',"+"'"+this.phone+"',"+
				"'"+this.department+"',"+"'"+this.idClient+"'";
	}
	
	public String toUpdateSqlString() {
		return "name='"+this.name+"',"+"email='"+this.email+"',"+"phone='"+this.phone+"',"+
				"department='"+this.department+"' WHERE id_contact="+this.idContact;
	}
}
