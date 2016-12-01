package com.cse.se;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.cse.se.dao.SubjectDao;
import com.cse.se.vo.Subject;

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
		RequestDispatcher rd= null;
		System.out.println("Inside show servlet");
		String course = request.getParameter("course");
		String sem = request.getParameter("semester");
		if(null!=course&&null!=sem){
			if(course.equals("--Select Course--")||sem.equals("--Select Semester--")){
				rd = request.getRequestDispatcher("viewSubjects.jsp");
				request.setAttribute("msg", "Please select valid values");
			}
			else{
				SubjectDao subDao = new SubjectDao();
				List<Subject> subjects = subDao.getSubjects(course, sem);
				
				JSONArray arr = new JSONArray();
				
				for(Subject subject:subjects){
					JSONObject obj = new JSONObject();
					obj.put("courseName", subject.getCourseName());
					obj.put("semester", subject.getSemester());
					obj.put("subjectType", subject.getSubjectType());
					obj.put("subjectName", subject.getSubjectName());
					
					arr.add(obj);
				}
				
				//obj.put("data",arr);
				PrintWriter pw = response.getWriter();
				pw.write(arr.toJSONString());
				pw.flush();
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
