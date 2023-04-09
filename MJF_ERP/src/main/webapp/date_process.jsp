<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>

<html>
<head>
<%
String startdate = request.getParameter("startdate");
String enddate = request.getParameter("enddate");
String tab = request.getParameter("tab");
String search = request.getParameter("search");
System.out.println(startdate+enddate+search);

if(search!=null){
	response.sendRedirect("MJF_Layout.jsp?pageChange=MJF_SalesAggregation.jsp?tab="+tab+"&startdate="+startdate+"&enddate="+enddate+"&search="+URLEncoder.encode(search));
}else{
	response.sendRedirect("MJF_Layout.jsp?pageChange=MJF_SalesAggregation.jsp?tab="+tab+"&startdate="+startdate+"&enddate="+enddate);
}

%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>