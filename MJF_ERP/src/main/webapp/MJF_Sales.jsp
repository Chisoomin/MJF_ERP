<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
  <%
        String subpage = "home";
        
        subpage = "subpage/" + subpage + ".jsp";
    %>
  <jsp:include page="MJF_SalesRegistration.jsp"></jsp:include>
  <jsp:include page="MJF_SalesRegistration.jsp"></jsp:include>

</body>
</html>