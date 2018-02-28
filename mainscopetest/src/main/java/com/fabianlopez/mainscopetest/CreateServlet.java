package com.fabianlopez.mainscopetest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fabianlopez.mainscopetest.controller.ServicesController;
import com.fabianlopez.mainscopetest.entities.Client;
import com.fabianlopez.mainscopetest.entities.Contact;

@WebServlet("/createServlet")
public class CreateServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1674102510731888993L;
	private ServicesController controller;

	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		controller = new  ServicesController();
		String result = "";
		if(request.getParameter("type").equals("client")) {
			Client client = createClient(request);
			result = controller.create("clients", client.toSqlString());
		}else {
			Contact contact = createContact(request);
			result = controller.create("contacts", contact.toSqlString());
		}
		
		if(!result.equals("ERROR")) {
			PrintWriter out = response.getWriter();
			out.println("Inserted correctly in database.");
		}else {
			PrintWriter out = response.getWriter();
			out.println("There was an error inserting in database.");
		}
	}
	
	private Client createClient(HttpServletRequest request) {
		Client client = new Client(request.getParameter("comercial"),
									request.getParameter("fiscal"),
									request.getParameter("rfc"),
									request.getParameter("address"),
									request.getParameter("neighborhood"),
									request.getParameter("postal"),
									request.getParameter("city"),
									request.getParameter("state"));
		return client;
	}
	
	private Contact createContact(HttpServletRequest request) {
		Integer idClient = Integer.parseInt(request.getParameter("client"));
		Contact contact = new Contact(request.getParameter("name"), 
									request.getParameter("email"), 
									request.getParameter("phone"), 
									request.getParameter("department"), 
									idClient);
		return contact;
	}
}
