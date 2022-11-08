<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.util.*"%>

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
	max-width: 100%;
	margin-top: -60px;
	margin-bottom: 40px;
	padding: 32px;
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
		<form action="MJF_AccountList_process.jsp" method="post" class="row">
		<table id="list" class="input-form" style="text-aling: center; border: 1px solid #7D766D">
			<thead>
				<tr style="color: #ffffff; background-color: #7D766D; height: 40px; text-align: center;">
				<th> </th>
				<th>순번</th>
				<th>등록일자</th>
				<th>거래처코드</th>
				<th>거래처명</th>
				<th>대표자</th>
				<th>업체구분</th>
				<th>업태</th>
				<th>연락처</th>
				<th>거래현황</th>
				</tr>
			</thead>
			<tbody>
				<%	
					int pageNumber = 1, cnt = 1;
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try{
						String Date, Code, Name, Ceo, setType, BusinessType, Tel, Valiable;
						String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com:3306/MJFdb";
						String user = "MJFdbRoot";
						String password = "mjfrootpw";
						request.setCharacterEncoding("utf-8");
						Class.forName("com.mysql.jdbc.Driver");
						conn = DriverManager.getConnection(url, user, password);
						
						String sql = "select * from MJFdb.account_table";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							Date = rs.getString(13);
							Code = rs.getString(1);
							Name = rs.getString(2);
							Ceo = rs.getString(3);
							setType = rs.getString(12);
							BusinessType = rs.getString(15);
							Tel = rs.getString(4);
							Valiable = rs.getString(14);
				%>
				<tr height="30" style="text-align: center;">
				<td><input type="checkbox" name="chk" value="<%=Code%>"></td>
				<td><%=cnt++%></td>
				<td><%=Date%></td>
				<td><a href="MJF_AccountDetail.jsp?Code=<%=Code%>" style="text-decoration-line: none; color: #000000;"><%=Code %></a></td>
				<td><%=Name%></td>
				<td><%=Ceo%></td>
				<td><%=setType%></td>
				<td><%=BusinessType%></td>
				<td><%=Tel%></td>
				<td><%=Valiable%></td>
				</tr>
				<% 	
						}
					} catch (SQLException ex){
						ex.printStackTrace();
					}	
				%>
				</table>
			<input type="button" width="50px" name="add" value="추가" onclick="location.href='MJF_AccountRegistration.jsp'" style="color: #ffffff; background-color: #7D766D;">
			<input type="submit" width="50px" name="del" value="삭제" style="color: #ffffff; background-color: #7D766D;">
		</form>
		</div>
	</div>
</body>
</html>