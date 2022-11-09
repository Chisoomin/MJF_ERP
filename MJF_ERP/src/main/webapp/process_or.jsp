<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<%
Connection conn = null;
Statement stmt = null;
Statement stmt2 = null;
ResultSet rs = null;
ResultSet rs2 = null;
int columnCount = 0;
int rowCount = 0;
String sujunum = request.getParameter("radiocheck");
String num=null,da=null, date=null, acc=null, code=null, name=null, me=null, qu=null, pp=null, sp=null, orderaccnum=null;


String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);

try {
	String sql = "SELECT order_num, order_date, account_name, product_code, product_name, product_measure, product_quantity, product_price, account_code from MJFdb.order_table where order_num='"+sujunum+"'";

	stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	rs = stmt.executeQuery(sql);
	ResultSetMetaData rsmd = rs.getMetaData();
	columnCount = rsmd.getColumnCount();
	rs.last(); //커서의 위치를 제일 뒤로 이동
	rowCount = rs.getRow(); //현재 커서의 Row Index 값을 저장
	String order_rs[][] = new String[rowCount][columnCount];
	int i = 0;
	int j = 0;
	rs.first();
	for (i = 0; i < rowCount; i++) {
		for (j = 0; j < columnCount; j++) {
			order_rs[i][j] = rs.getString((j + 1));
		}
		rs.next();
	}
	
	
	
	num = order_rs[0][0];
	da= order_rs[0][1];
	acc= order_rs[0][2];
	code= order_rs[0][3];
	orderaccnum=order_rs[0][8];
	/*name= order_rs[0][4];
	me= order_rs[0][5];
	qu= order_rs[0][6];
	pp= order_rs[0][7];
	
	sp = ""+Integer.parseInt(qu)*Integer.parseInt(pp);*/

} catch (SQLException ex) {
	out.println("SQLException " + ex.getMessage());
} finally {
	if (rs != null)
		rs.close();
	if (stmt != null)
		stmt.close();
	if (conn != null)
		conn.close();
}
String ju = "\"MJF_SalesRegistration.jsp\"";

out.println("<script type='text/javascript'>");
out.println("opener.document.getElementById('ordernumber').value ='"+num+"';");
out.println("opener.document.getElementById('orderda').value ='"+da+"';");
out.println("opener.document.getElementById('orderacc').value ='"+acc+"';");
out.println("opener.document.getElementById('orderaccnum').value ='"+orderaccnum+"';");
out.println("opener.document.getElementById('detail').value ='"+num+"';");
/*out.println("var f='"+num+"';");
out.println("document.domain = 'localhost';");
out.println("opener.name = 'openerNames';");
out.println("f.target = 'openerNames';");
out.println("f.submit();");
out.println("opener.document.getElementById('procode').value ='"+code+"';");
out.println("opener.document.getElementById('proname').value ='"+name+"';");
out.println("opener.document.getElementById('orderme').value ='"+me+"';");
out.println("opener.document.getElementById('orderqu').value ='"+qu+"';");
out.println("opener.document.getElementById('orderpp').value ='"+pp+"';");
out.println("opener.document.getElementById('ordersp').value ='"+sp+"';");
out.println("var form = document.createElement('form');"); // 폼객체 생성
out.println("var objs");
out.println("objs = document.createElement('input');"); // 값이 들어있는 녀석의 형식
out.println("objs.setAttribute('type', 'text');"); // 값이 들어있는 녀석의 type
out.println("objs.setAttribute('name', 'suju');"); // 객체이름
out.println("objs.setAttribute('value', "+num+");"); //객체값
out.println("form.appendChild(objs);");
out.println("form.setAttribute('method', 'post');"); //get,post 가능
out.println("form.setAttribute('action', \"teest.jsp\");"); //보내는 url
out.println("document.body.appendChild(form);");
out.println("form.submit();");*/



out.println("window.close();");
out.println("</script>");

%>
<head>
<meta charset="UTF-8">
<%-- <script type="text/javascript">
	opener.document.getElementById('ordernum').value = <%= numm+"-" %>;
	window.close();
</script> --%>
<title>Insert title here</title>
</head>
<body>
<input type = "text" id="suju" name="suju" value="<%=sujunum %>" readonly>

</body>
</html>