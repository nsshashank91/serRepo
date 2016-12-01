package com.cse.se.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cse.se.vo.Subject;

public class SubjectDao {

	Connection con;
	PreparedStatement preparedStatement;
	
	public boolean insertSubject(Subject subject){
		try{
			con = JDBCHelper.getConnection();
			String insertSubject = "INSERT INTO subject"
					+ "(courseName, semester, subjectType, subjectName) VALUES"
					+ "(?,?,?,?)";
			preparedStatement = con.prepareStatement(insertSubject);
			preparedStatement.setString(1, subject.getCourseName());
			preparedStatement.setString(2, subject.getSemester());
			preparedStatement.setString(3, subject.getSubjectType());
			preparedStatement.setString(4, subject.getSubjectName());
			// execute insert SQL stetement
			preparedStatement .executeUpdate();
			JDBCHelper.closeConnection(con);
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
		finally{
			if(null!=preparedStatement){
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(null!=con){
				try {
					JDBCHelper.closeConnection(con);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
	
	public List<Subject> getSubjects(String courseName, String semester){
		List<Subject> subjects = new ArrayList<Subject>();
		try{
			con = JDBCHelper.getConnection();
			String subjectQuery = "select subjectName, subjectType from subject where courseName=? and semester=?";
			
			preparedStatement = con.prepareStatement(subjectQuery);
			preparedStatement.setString(1, courseName);
			preparedStatement.setString(2, semester);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {

				String subjectName = rs.getString("subjectName");
				String subjectType = rs.getString("subjectType");

				System.out.println("subjectName : " + subjectName);
				System.out.println("subjectType : " + subjectType);
				Subject subject = new Subject();
				subject.setSemester(semester);
				subject.setCourseName(courseName);
				subject.setSubjectName(subjectName);
				subject.setSubjectType(subjectType);
				subjects.add(subject);

			}
			return subjects;

		}
		catch(Exception e){
			e.printStackTrace();
			return null;
		}
		finally{
			if(null!=preparedStatement){
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return null;
				}
			}
			if(null!=con){
				try {
					JDBCHelper.closeConnection(con);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return null;
				}
			}
		}
		
	}
}
