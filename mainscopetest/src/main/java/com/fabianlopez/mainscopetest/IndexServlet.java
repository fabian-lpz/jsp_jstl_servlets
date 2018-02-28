package com.fabianlopez.mainscopetest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/indexActions")
public class IndexServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1542799284293902424L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.println("Test Ajax Call");
	}
}
