<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.text.SimpleDateFormat"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>

<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
<jsp:setProperty name="bbs" property="code"/>
<jsp:setProperty name="bbs" property="name"/>
<jsp:setProperty name="bbs" property="ceo"/>
<jsp:setProperty name="bbs" property="tel"/>
<jsp:setProperty name="bbs" property="fax"/>
<jsp:setProperty name="bbs" property="email"/>
<jsp:setProperty name="bbs" property="postcode"/>
<jsp:setProperty name="bbs" property="addr1"/>
<jsp:setProperty name="bbs" property="addr2"/>
<jsp:setProperty name="bbs" property="website"/>
<jsp:setProperty name="bbs" property="remark"/>
<jsp:setProperty name="bbs" property="type"/>
<jsp:setProperty name="bbs" property="begin_date"/>
<jsp:setProperty name="bbs" property="vailable"/>
<jsp:setProperty name="bbs" property="type_of_business"/>
<jsp:setProperty name="bbs" property="items_of_business"/>
<jsp:setProperty name="bbs" property="sales_name"/>
<jsp:setProperty name="bbs" property="sales_tel"/>
<jsp:setProperty name="bbs" property="sales_email"/>
<jsp:setProperty name="bbs" property="bank_name"/>
<jsp:setProperty name="bbs" property="account_number"/>
<jsp:setProperty name="bbs" property="account_holder"/>
<!DOCTYPE html>
<html>
<body>
<%
request.setCharacterEncoding("utf-8");
Class.forName("com.mysql.jdbc.Driver");

	BbsDAO bbsDAO=new BbsDAO();//하나의 인스턴스
	int result=bbsDAO.write(bbs.getcode(), bbs.getname(), bbs.getceo(), bbs.gettel(), bbs.getfax(), bbs.getemail(), bbs.getpostcode(), bbs.getaddr1(), bbs.getaddr2(), bbs.getwebsite(), bbs.getremark(), bbs.gettype(), bbs.getbegin_date(), bbs.getvailable(), bbs.gettype_of_business(), bbs.getitems_of_business(), bbs.getsales_name(), bbs.getsales_tel(), bbs.getsales_email(), bbs.getbank_name(), bbs.getaccount_number(), bbs.getaccount_holder());
	if(result == -1){//데이터 베이스 오류가 날 때
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('글쓰기에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else{
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('등록 되었습니다.')");
		script.println("location.href='MJF_Layout.jsp?pageChange=MJF_AccountList.jsp?pageNumber=1'");
		script.println("</script>");
	}
%>
</body>
</html>