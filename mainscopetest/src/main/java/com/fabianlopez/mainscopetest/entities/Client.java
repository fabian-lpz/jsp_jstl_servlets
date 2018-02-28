package com.fabianlopez.mainscopetest.entities;

public class Client {
	private Integer idClient;
	private String comercial;
	private String fiscal;
	private String rfc;
	private String address;
	private String neighborhood;
	private String postalCode;
	private String city;
	private String state;
	private Integer status;
	
	public Client() {
	}
	
	
	
	public Client(String comercial, String fiscal, String rfc, String address, String neighborhood,
			String postalCode, String city, String state) {
		super();
		this.comercial = comercial;
		this.fiscal = fiscal;
		this.rfc = rfc;
		this.address = address;
		this.neighborhood = neighborhood;
		this.postalCode = postalCode;
		this.city = city;
		this.state = state;
		this.status = 1;
	}

	public Client(Integer idClient, String comercial, String fiscal, String rfc, String address, String neighborhood,
			String postalCode, String city, String state) {
		super();
		this.idClient = idClient;
		this.comercial = comercial;
		this.fiscal = fiscal;
		this.rfc = rfc;
		this.address = address;
		this.neighborhood = neighborhood;
		this.postalCode = postalCode;
		this.city = city;
		this.state = state;
		this.status = 1;
	}

	public Integer getId_client() {
		return idClient;
	}
	public void setId_client(Integer id_client) {
		this.idClient = id_client;
	}
	public String getComercial() {
		return comercial;
	}
	public void setComercial(String comercial) {
		this.comercial = comercial;
	}
	public String getFiscal() {
		return fiscal;
	}
	public void setFiscal(String fiscal) {
		this.fiscal = fiscal;
	}
	public String getRfc() {
		return rfc;
	}
	public void setRfc(String rfc) {
		this.rfc = rfc;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getNeighborhood() {
		return neighborhood;
	}
	public void setNeighborhood(String neighborhood) {
		this.neighborhood = neighborhood;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	public String toSqlString() {
		return "null,"+"'"+this.comercial+"',"+"'"+this.fiscal+"',"+
				"'"+this.rfc+"',"+"'"+this.address+"',"+"'"+this.neighborhood+"',"+
				"'"+this.postalCode+"',"+"'"+this.city+"',"+"'"+this.state+"',"+
				"'"+this.status+"'";
	}
	
	public String toUpdateSqlString() {
		return "comercial='"+this.comercial+"',"+"fiscal='"+this.fiscal+"',"+
				"rfc='"+this.rfc+"',"+"address='"+this.address+"',"+"neighborhood='"+this.neighborhood+"',"+
				"postal_code='"+this.postalCode+"',"+"city='"+this.city+"',"+"state='"+this.state+"' WHERE id_client="+idClient;
	}
}
