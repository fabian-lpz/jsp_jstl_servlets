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

@WebServlet("/updateServlet")
public class UpdateServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 849744423262606867L;
	private ServicesController controller;

	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		controller = new  ServicesController();
		String result = "";
		if(request.getParameter("type").equals("client")) {
			Client client = createClient(request);
			result = controller.update("clients", client.toUpdateSqlString());
		}else {
			Contact contact = createContact(request);
			result = controller.update("contacts", contact.toUpdateSqlString());
		}
		
		if(!result.equals("ERROR")) {
			PrintWriter out = response.getWriter();
			out.println("Updated correctly in database.");
		}else {
			PrintWriter out = response.getWriter();
			out.println("There was an error updating in database.");
		}
	}
	
	private Client createClient(HttpServletRequest request) {
		Integer idClient = Integer.parseInt(request.getParameter("client"));
		Client client = new Client(idClient,
									request.getParameter("comercial"),
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
		Integer idContact = Integer.parseInt(request.getParameter("contact"));
		Contact contact = new Contact(idContact,
									request.getParameter("name"), 
									request.getParameter("email"), 
									request.getParameter("phone"), 
									request.getParameter("department"));
		return contact;
	}
}
