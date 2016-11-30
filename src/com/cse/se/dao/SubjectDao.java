package com.cse.se.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
}
