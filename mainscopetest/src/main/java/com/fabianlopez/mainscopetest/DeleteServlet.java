package com.fabianlopez.mainscopetest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fabianlopez.mainscopetest.controller.ServicesController;

@WebServlet("/deleteServlet")
public class DeleteServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 780330833438985884L;
	private ServicesController controller;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		controller = new ServicesController();
		String result = "";
		if(request.getParameter("type").equals("client")) {
			result = controller.deleteClient(request.getParameter("id"));
		}else {
			result = controller.deleteContact(request.getParameter("id"));
		}
		if(result.equals("CORRECT")) {
			PrintWriter out = response.getWriter();
			out.println("Deleted correctly from database.");
		} else {
			PrintWriter out = response.getWriter();
			out.println("Error deleting from database.");
		}
	}
}
