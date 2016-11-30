package com.cse.se.vo;

public class Subject {

	private int subjectId;
	private String subjectName;
	private String courseName;
	private String subjectType;
	private String semester;
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getSubjectType() {
		return subjectType;
	}
	public void setSubjectType(String subjectType) {
		this.subjectType = subjectType;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((courseName == null) ? 0 : courseName.hashCode());
		result = prime * result
				+ ((semester == null) ? 0 : semester.hashCode());
		result = prime * result + subjectId;
		result = prime * result
				+ ((subjectName == null) ? 0 : subjectName.hashCode());
		result = prime * result
				+ ((subjectType == null) ? 0 : subjectType.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Subject other = (Subject) obj;
		if (courseName == null) {
			if (other.courseName != null)
				return false;
		} else if (!courseName.equals(other.courseName))
			return false;
		if (semester == null) {
			if (other.semester != null)
				return false;
		} else if (!semester.equals(other.semester))
			return false;
		if (subjectId != other.subjectId)
			return false;
		if (subjectName == null) {
			if (other.subjectName != null)
				return false;
		} else if (!subjectName.equals(other.subjectName))
			return false;
		if (subjectType == null) {
			if (other.subjectType != null)
				return false;
		} else if (!subjectType.equals(other.subjectType))
			return false;
		return true;
	}
	
	
	
}
