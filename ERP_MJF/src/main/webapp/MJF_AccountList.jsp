<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.util.*"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/styles.css" />

<style>
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#efe8db),
		to(#efe8db));
	background: -webkit-linear-gradient(bottom left, #efe8db 0%, #efe8db 100%);
	background: -moz-linear-gradient(bottom left, #efe8db 0%, #efe8db 100%);
	background: -o-linear-gradient(bottom left, #efe8db 0%, #efe8db 100%);
	background: linear-gradient(to top right, #efe8db 0%, #efe8db 100%);
}

.input-form {
	max-width: 100%;
	margin-top: 80px;
	margin-bottom: 20px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}

.input-title {
	max-width: 100%;
	margin-top: 40px;
	margin-bottom: -60px;
	padding: 32px;
	background: #7D766D;
	color: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}

.input-table {
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}

.btn-set {
	color: #fff;
	background-color: #7D766D;
	border-color: #7D766D;
}

.white {
	color: #fff;
}

.ct {
	text-align: center;
	vertical-align: middle;
}
</style>
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-title md-auto mx-auto">
				<h1>거래처목록</h1>
			</div>
		</div>
	</div>
	<div class="container">
	<div class="input-form-backgroud row">
	<div style="margin-top: 75px;">
			<form method="post" name="search" action="MJF_AccountSearchList.jsp">
				<table>
					<tr>
						<td style="width:150px"><select class="form-control" id="searchfield" name="searchfield">
								<option value="1">선택</option>
								<option value="account_code">사업자등록번호</option>
								<option value="account_name">거래처명</option>
								<option value="account_ceo">대표자</option>
								<option value="account_type">업체구분</option>
								<option value="account_vailable">거래현황</option>
								<option value="type_of_business">업태</option>
								<option value="items_of_business">종목</option>
								<option value="account_address">주소</option>
						</select></td>
						<td><input type="text" class="form-control" placeholder="검색어 입력" id = "searchtext" name="searchtext" maxlength="100"></td>
						<td><button type="submit" class="btn btn-set btn-block">검색</button></td>
					</tr>
				</table>
			</form>
		</div>
		</div>
	</div>
	<div class="container">
	<div class="input-form-backgroud row">
	<div style="margin-top: 12px;">
		<form action="MJF_AccountList_process.jsp" method="post" class="row">
		<table class="input-table" id="list">
			<thead>
				<tr style="color: #ffffff; background-color: #7D766D; height: 40px; text-align: center;">
				<th></th>
				<th>순번</th>
				<th>등록일자</th>
				<th>거래처코드</th>
				<th>거래처명</th>
				<th>대표자</th>
				<th>업체구분</th>
				<th>업태</th>
				<th>연락처</th>
				<th style="padding : 5px;">거래현황</th>
				</tr>
			</thead>
			<tbody>
				<%	
				int pageNumber = 1;//기본적으로 1페이지
				if (request.getParameter("pageNumber") != null)
					pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
				BbsDAO bbsDAO = new BbsDAO();
				ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
				for (int i = 0; i < list.size(); i++) {
				%>
				<tr height="30" style="text-align: center;">
				<td><input type="checkbox" name="chk" value="<%=list.get(i).getcode()%>"></td>
				<td><%=list.get(i).getnum()%></td>
				<td><%=list.get(i).getbegin_date()%></td>
				<td><a href="MJF_AccountDetail.jsp?Code=<%=list.get(i).getcode()%>" style="text-decoration-line: none; color: #000000;"><%=list.get(i).getcode()%></a></td>
				<td><%=list.get(i).getname()%></td>
				<td><%=list.get(i).getceo()%></td>
				<td><%=list.get(i).gettype()%></td>
				<td><%=list.get(i).gettype_of_business()%></td>
				<td><%=list.get(i).gettel()%></td>
				<td><%=list.get(i).getvailable()%></td>
				</tr>
				</tbody>
				<% 	
						}
				%>
				</table>
				<div class=container style="margin-top: 12px; text-align: center">
				<%
					if (pageNumber != 1) {//이전페이지로
				%>
				<a href="MJF_AccountList.jsp?pageNumber=<%=pageNumber - 1%>" style="text-decoration-line: none; color: #7D766D;">◀ 이전</a>
				<%
					}
				%>
				<%
					int n = (int) (bbsDAO.getCount() / 10 + 1);
					for (int i = 1; i <= n; i++) {
				%>
				<a href="MJF_AccountList.jsp?pageNumber=<%=i%>" style="text-decoration-line: none; color: #7D766D;">|<%=i%>|
				</a>
				<%
					}
				%>
				<%
					if (bbsDAO.nextPage(pageNumber + 1)) {//다음페이지가 존재하는가
				%>
				<a href="MJF_AccountList.jsp?pageNumber=<%=pageNumber + 1%>" style="text-decoration-line: none; color: #7D766D;">다음 ▶</a>
				<%
					}
				%>
				<input type="button" class="btn btn-set btn-block pull-right" name="add" value="추가" onclick="location.href='MJF_AccountRegistration.jsp'">
				<input type="submit" class="btn btn-set btn-block pull-right" name="del" value="사용중지" >
			</div>
		</form>
		</div>
		</div>
	</div>
</body>
</html>