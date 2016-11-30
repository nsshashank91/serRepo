package com.cse.se;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside do post login servlet");
		String name = request.getParameter("username");
		String pwd = request.getParameter("password");
		RequestDispatcher rd = null;
		if(null==name||null==pwd){
			response.sendRedirect("/SERS/AdminLogin.jsp");
			return;
		}
		if(name.trim().equals("")||pwd.trim().equals("")){
			Logger.getLogger("login").info("Incorrect credentials");
			request.setAttribute("error", "invalid");
			rd = request.getRequestDispatcher("AdminLogin.jsp");
			rd.forward(request, response);
			//response.sendRedirect("/SERS/AdminLogin.jsp");
			return;
		}
		if(name.trim().equals("admin")&&pwd.trim().equals("admin479")){
			HttpSession mySession = request.getSession(true);
			mySession.setAttribute("user", "admin");
			rd = request.getRequestDispatcher("admin.jsp");
			rd.forward(request, response);
		}
		else{
			Logger.getLogger("login").info("Incorrect credentials");
			request.setAttribute("error", "invalid");
			rd = request.getRequestDispatcher("AdminLogin.jsp");
			rd.forward(request, response);
			//response.sendRedirect("/SERS/AdminLogin.jsp");
			
			
		}

	}

}
