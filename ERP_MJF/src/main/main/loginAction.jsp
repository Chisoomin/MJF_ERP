<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="USER.UserDao"%>
<%@ page import="java.io.PrintWriter"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="User" class="USER.User" scope="page" />
<jsp:setProperty name="User" property="member_name" />
<jsp:setProperty name="User" property="member_id" />
<jsp:setProperty name="User" property="role" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>loginAction</title>
</head>
<body>
	<%
          UserDao userDAO = new UserDao();
          int result = userDAO.login(User.getMember_name(), User.getMember_id());
          String msg= "";
          String role = userDAO.role;
          String member_name= request.getParameter("member_name");
          
          
          if (result == 1){
        	  PrintWriter script = response.getWriter();
        	  session.setAttribute("member_name",member_name);
        	  session.setAttribute("role",role);
        	  script.println("<script>");
        	  script.println("location.href = 'MJF_Layout.jsp'");
        	  script.println("</script>");
        	  msg="../../MJF_Layout.jsp";
          }
          else if(result == 0){
        	  PrintWriter script = response.getWriter();
        	  script.println("<script>");
        	  script.println("alert('비밀번호가 틀립니다')");
        	  script.println("history.back()");
        	  script.println("</script>");
          }
          else if(result == -1){
        	  PrintWriter script = response.getWriter();
        	  script.println("<script>");
        	  script.println("alert('존재하지 않는 아이디입니다')");
        	  script.println("history.back()");
        	  script.println("</script>");
        	  
          }
          else if(result == -2){
        	  PrintWriter script = response.getWriter();
        	  script.println("<script>");
        	  script.println("alert('데이터베이스 오류가 발생했습니다')");
        	  script.println("history.back()");
        	  script.println("</script>");
          }
          
        
    %>
</body>
</html>