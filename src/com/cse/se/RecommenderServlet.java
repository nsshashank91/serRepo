package com.cse.se;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cse.se.dao.SubjectDao;

/**
 * Servlet implementation class RecommenderServlet
 */
public class RecommenderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommenderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = null;
		String course = request.getParameter("select_course");
		String semester = request.getParameter("select_semester");
		String interest = request.getParameter("select_interest");
		if(null!=course&&null!=semester&&null!=interest){
			if(!course.equals("--Select Course--")||!semester.equals("--Select Semester--")||!interest.equals("--Select Interest--")){
				SubjectDao subDao = new SubjectDao();
				String recommendedSubject = subDao.recommendSubject(course, semester, interest);
				if(null!=recommendedSubject){
					rd = request.getRequestDispatcher("Recommender.jsp");
					request.setAttribute("subject", recommendedSubject);
					request.setAttribute("semester", semester);
					request.setAttribute("course", course);
					rd.forward(request, response);
				}
				else{
					rd = request.getRequestDispatcher("student.jsp");
					request.setAttribute("msg", "Sorry system is under maintenance. Please try after some time..");
					rd.forward(request, response);
				}
			}
		}
		else{
			rd = request.getRequestDispatcher("student.jsp");
			request.setAttribute("msg", "Select All Options");
			rd.forward(request, response);
		}
		
		
	}

}
