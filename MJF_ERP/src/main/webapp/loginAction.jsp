<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="member_name"/>
<jsp:setProperty name="user" property="member_id"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>loginAction</title>
</head>
<body>
<%
          UserDAO userDAO = new UserDAO();
          int result = userDAO.login(user.getMember_name(), user.getMember_id());
          String msg= "";
          String member_name= request.getParameter("member_name");
          if (result == 1){
        	  PrintWriter script = response.getWriter();
        	  script.println("<script>");
        	  script.println("location.href = 'MJF_Layout.jsp'");
        	  script.println("</script>");
        	  session.setAttribute("member_name",member_name);
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