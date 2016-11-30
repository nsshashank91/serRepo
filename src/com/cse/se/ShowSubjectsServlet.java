package com.cse.se;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class ShowSubjectsServlet
 */
public class ShowSubjectsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowSubjectsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Inside show servlet");
		//JSONObject obj = new JSONObject();
		JSONArray arr = new JSONArray();
		JSONObject obj1 = new JSONObject();
		obj1.put("name", "shashank");
		obj1.put("position", "System Architect");
		obj1.put("office", "New York");
		obj1.put("extn", "4226");
		obj1.put("start_date", "2009/08/19");
		obj1.put("salary", "$139,575");
		arr.add(obj1);
		//obj.put("data",arr);
		PrintWriter pw = response.getWriter();
		pw.write(arr.toJSONString());
		pw.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
