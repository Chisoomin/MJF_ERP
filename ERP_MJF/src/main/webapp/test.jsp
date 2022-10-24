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
		out.println("db 연결 성공");

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
		out.println("회원가입이 완료되었습니다.");
	}catch(SQLException ex){
		out.println("회원가입 실패 : "+ex.getMessage());
	}finally{
		if(pstmt != null)pstmt.close();
		if(conn!=null)conn.close();
	}*/
%>