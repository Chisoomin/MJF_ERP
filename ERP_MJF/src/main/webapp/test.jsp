<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
	String user = "MJFdbRoot";
	String password = "mjfrootpw";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,password);
	
	try{
		out.println("db ���� ����");

	}catch(Exception e){
		e.printStackTrace();
	}
	/*try{
		String sql = "INSERT INTO members(name, birthday,r_id, pwd) VALUE(?,?,?,?);";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,r_name);
		pstmt.setString(2,r_birthday);
		pstmt.setString(3,r_id);
		pstmt.setString(4,r_pwd);
		pstmt.executeUpdate();
		out.println("ȸ�������� �Ϸ�Ǿ����ϴ�.");
	}catch(SQLException ex){
		out.println("ȸ������ ���� : "+ex.getMessage());
	}finally{
		if(pstmt != null)pstmt.close();
		if(conn!=null)conn.close();
	}*/
%>