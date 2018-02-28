package com.fabianlopez.mainscopetest;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fabianlopez.mainscopetest.controller.ServicesController;
import com.fabianlopez.mainscopetest.entities.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ServicesController controller;

	public void doPost(HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if(!username.isEmpty()&&!password.isEmpty()) {
			controller = new ServicesController();
			try {
				User user = controller.listUsers(username, password);
				if(user!=null) {
					HttpSession session = request.getSession();
					session.setAttribute("username", user.getUsername());
					session.setMaxInactiveInterval(30*60);
//					Cookie userName = new Cookie("username", user.getUsername());
//					userName.setMaxAge(30*60);
//					response.addCookie(userName);
					response.sendRedirect("index.jsp");
				}else {
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
					PrintWriter out = response.getWriter();
					out.println("<font color=red>Wrong username or password.</font>");
					rd.include(request, response);
				}
			}catch(SQLException sqle){
				System.out.println(sqle);
			}
		} else {
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
			PrintWriter out= response.getWriter();
			out.println("<font color=red>Data must not be null.</font>");
			rd.include(request, response);
		}
		
	}
}
