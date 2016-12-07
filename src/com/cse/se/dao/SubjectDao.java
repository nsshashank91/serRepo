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
	
	public String recommendSubject(String courseName, String semester, String subjectType){
		
		try{
			con = JDBCHelper.getConnection();
			String subjectQuery = "select subjectName from subject where courseName=? and semester=? and subjectType=?";
			
			preparedStatement = con.prepareStatement(subjectQuery);
			preparedStatement.setString(1, courseName);
			preparedStatement.setString(2, semester);
			preparedStatement.setString(3, subjectType);
			ResultSet rs = preparedStatement.executeQuery();
			String subjectName = null;
			while (rs.next()) {

				subjectName = rs.getString("subjectName");
				

				System.out.println("subjectName : " + subjectName);
				break;
				
			}
			if(null!=subjectName){
				return subjectName;
			}
			else{
				return null;
			}

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
	
public boolean submitFeedBack(String courseName, String semester, int feedback, String subjectName){
		
		try{
			con = JDBCHelper.getConnection();
			System.out.println(" "+feedback+" "+courseName+" "+semester+" "+subjectName+" Inside submitfeedback sub dao");
			String feedbackCountQuery = "select feedback,feedbackCount,subjectId from subject where courseName=? and semester=? and subjectName=?";
			
			preparedStatement = con.prepareStatement(feedbackCountQuery);
			preparedStatement.setString(1, courseName);
			preparedStatement.setString(2, semester);
			preparedStatement.setString(3, subjectName);
			ResultSet rs = preparedStatement.executeQuery();
			int subjectId = 0;
			int fbCount = 0;
			int fbVal=0;
			if (rs.next()) {
				System.out.println("inside submit feed back get feedback count");
				subjectId = rs.getInt("subjectId");
				fbCount = rs.getInt("feedbackCount");
				fbVal = rs.getInt("feedback");
				if(0!=subjectId){
					if(0!=fbCount){
						System.out.println("inside submit feed back update feedback count");
						int fbc =  fbVal+feedback;
						String subjectQuery = "update subject set feedback=?, feedbackCount=feedbackCount+1 where subjectId=?";
						preparedStatement = con.prepareStatement(subjectQuery);
						
						System.out.println("Total fb count = "+fbc);
						preparedStatement.setInt(1,fbc);
					}
					else{
						String subjectQuery = "update subject set feedback=?, feedbackCount=1 where subjectId=?";
						preparedStatement = con.prepareStatement(subjectQuery);
						preparedStatement.setInt(1, feedback);
					}
					
					preparedStatement.setInt(2, subjectId);
					int res = preparedStatement.executeUpdate();
					if (res>0) {
						System.out.println("inside submit feed back update feedback count successful");
						return true;
						
						
					}
					else{
						System.out.println("inside submit feed back update feedback count fail 1");
						return false;
					}
				}
				else{
					System.out.println("inside submit feed back update feedback count fail 2");
					return false;
				}
			}
			else{
				System.out.println("inside submit feed back update feedback count fail 3");
				System.out.println(" "+feedback+" "+courseName+" "+semester+" "+subjectName);
				String subjectQuery = "update subject set feedback=?, feedbackCount=1 where courseName=? and semester=? and subjectName=?";
				preparedStatement = con.prepareStatement(subjectQuery);
				preparedStatement.setInt(1, feedback);
				preparedStatement.setString(2, courseName);
				preparedStatement.setString(3, semester);
				preparedStatement.setString(4, subjectName);
				int res = preparedStatement.executeUpdate();
				if (res>0) {
					System.out.println("inside submit feed back update feedback count successful");
					return true;
					
					
				}
				else{
					System.out.println("inside submit feed back update feedback count fail 1 second");
					return false;
				}
				
			}
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("inside submit feed back update feedback count fail 4");
			return false;
		}
		finally{
			if(null!=preparedStatement){
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("inside submit feed back update feedback count fail 5");
					return false;
				}
			}
			if(null!=con){
				try {
					JDBCHelper.closeConnection(con);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("inside submit feed back update feedback count fail 6");
					return false;
				}
			}
		}
		
	}
}
