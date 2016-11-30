package com.cse.se;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cse.se.dao.SubjectDao;
import com.cse.se.vo.Subject;

/**
 * Servlet implementation class AddSubjectServlet
 */
public class AddSubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSubjectServlet() {
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
		System.out.println("Inside do post of add subject servlet");
		String course = request.getParameter("select_course");
		String semester = request.getParameter("select_semester");
		String subjectType = request.getParameter("select_subject_type");
		String subjectName = request.getParameter("subject_name");
		SubjectDao subjectDao = new SubjectDao();
		Subject subject = new Subject();
		if(null!=course&&!course.trim().equals("")){
			subject.setCourseName(course);
		}
		if(null!=semester&&!semester.trim().equals("")){
			subject.setSemester(semester);
		}
		if(null!=subjectType&&!subjectType.trim().equals("")){
			subject.setSubjectType(subjectType);
		}
		if(null!=subjectName&&!subjectName.trim().equals("")){
			subject.setSubjectName(subjectName);
		}
		boolean subInsert = subjectDao.insertSubject(subject);
		RequestDispatcher rd = null;
		if(subInsert){
			System.out.println("Inserted successfully");
			request.setAttribute("msg", "subject added successfully");
			rd = request.getRequestDispatcher("addSubject.jsp");
			rd.forward(request, response);
		}
		else{
			System.out.println("Subject not inserted");
			request.setAttribute("msg", "subject not added successfully");
			rd = request.getRequestDispatcher("addSubject.jsp");
			rd.forward(request, response);
		}
	}

}
