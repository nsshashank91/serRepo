package com.cse.se;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cse.se.dao.SubjectDao;

/**
 * Servlet implementation class FeedBackServlet
 */
public class FeedBackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedBackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside do get feed back servlet");
		String feedback = request.getParameter("select_feedback");
		int feedbackNum = Integer.parseInt(feedback);
		String sem = request.getParameter("semester");
   		String course = request.getParameter("course");
   		String sub = request.getParameter("subject");
   		System.out.println(" "+feedback+" "+course+" "+sem+" "+sub+" Inside doget feedback");
		boolean feedbackvalue;
		RequestDispatcher rd=null;
		if(null!=feedback){
			if(!feedback.equals("--Select Feedback--")){
				SubjectDao subDao = new SubjectDao();
				feedbackvalue=subDao.submitFeedBack(course, sem, feedbackNum, sub);
				if(feedbackvalue){
					System.out.println("Feed Back value="+feedbackvalue);
					rd = request.getRequestDispatcher("student.jsp");
					request.setAttribute("msg", "Thank you!! Feedback Submitted Successfully");
					rd.forward(request, response);
				}
				else{
					rd = request.getRequestDispatcher("student.jsp");
					rd.forward(request, response);
				}
			}
			else{
				rd = request.getRequestDispatcher("student.jsp");
				rd.forward(request, response);
			}
		}
		else{
			rd = request.getRequestDispatcher("student.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
