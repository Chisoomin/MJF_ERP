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
String num = null, da = null, date = null, acc = null, code = null, name = null, me = null, qu = null, pp = null,
		sp = null, orderaccnum = null;

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.cj.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);

try {
	String sql = "SELECT * from MJFdb.sales_table where order_num='" + sujunum + "' and product_quantity<0 and sales_note='반품'";

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
	System.out.println(order_rs[i][j]);
		}
		rs.next();
	}
	System.out.println(rowCount + " " + columnCount);

	/*num = order_rs[0][0];
	da = order_rs[0][1];
	acc = order_rs[0][2];
	code = order_rs[0][3];
	orderaccnum = order_rs[0][8];
	name= order_rs[0][4];
	me= order_rs[0][5];
	qu= order_rs[0][6];
	pp= order_rs[0][7];
	
	sp = ""+Integer.parseInt(qu)*Integer.parseInt(pp);*/

	out.println("<script type='text/javascript'>");
	out.println("opener.document.getElementById('ordernumber').value ='" + order_rs[0][1] + "';");
	out.println("opener.document.getElementById('orderda').value ='" + order_rs[0][4] + "';");
	out.println("opener.document.getElementById('orderacc').value ='" + order_rs[0][6] + "';");
	out.println("opener.document.getElementById('orderaccnum').value ='" + order_rs[0][5] + "';");
	out.println("opener.document.getElementById('detail').value ='" + num + "';");
	
	out.println("opener.document.getElementById('chdate').innerText = '반품날짜';");

	out.println("opener.document.getElementById('ch_main').checked = true;");

	int total = 0;

	//테이블에 추가
	out.println("const table = opener.document.getElementById('orderlist');");
	//테이블 초기화
	out.println("if(table.rows.length>2){for(let i=2; i <= table.rows.length; i++){ table.deleteRow(-1);}}");
	//out.println("opener.document.getElementById('tbd').empty();");

	for (int n = 0; n < rowCount; n++) {
		// 새 행(Row) 추가
		out.println("const newRow" + n + " = table.insertRow();");
		// 새 행(Row)에 Cell 추가
		out.println("const newCell" + n + "1 = newRow" + n + ".insertCell(0);");
		out.println("const newCell" + n + "2 = newRow" + n + ".insertCell(1);");
		out.println("const newCell" + n + "3 = newRow" + n + ".insertCell(2);");
		out.println("const newCell" + n + "4 = newRow" + n + ".insertCell(3);");
		out.println("const newCell" + n + "5 = newRow" + n + ".insertCell(4);");
		out.println("const newCell" + n + "6 = newRow" + n + ".insertCell(5);");
		out.println("const newCell" + n + "7 = newRow" + n + ".insertCell(6);");
		out.println("const newCell" + n + "8 = newRow" + n + ".insertCell(7);");
		out.println("const newCell" + n + "9 = newRow" + n + ".insertCell(8);");
		out.println("const newCell" + n + "10 = newRow" + n + ".insertCell(9);");
		out.println("const newCell" + n + "11 = newRow" + n + ".insertCell(10);");
		out.println("const newCell" + n + "12 = newRow" + n + ".insertCell(11);");
		out.println("const newCell" + n + "13 = newRow" + n + ".insertCell(12);");

		// Cell에 텍스트 추가
		out.println("var x = document.createElement(\"INPUT\");");
		out.println("x.setAttribute(\"type\", \"checkbox\");");
		out.println("x.setAttribute(\"class\", \"table-input-style\");");
		out.println("x.setAttribute(\"name\", \"ch\");");
		out.println("x.setAttribute(\"checked\", \"checked\");");
		out.println("x.setAttribute(\"value\", \"" + n + "\");");
		out.println("newCell" + n + "1.append(x)");

		out.println("var y = document.createElement(\"INPUT\");");
		out.println("y.setAttribute(\"type\", \"text\");");
		out.println("y.setAttribute(\"class\", \"table-input-style\");");
		out.println("y.setAttribute(\"name\", \"memname" + n + "\");");
		out.println("y.setAttribute(\"id\", \"memname" + n + "\");");
		out.println("y.setAttribute(\"value\", \"" + order_rs[n][18] + "\");");
		out.println("y.setAttribute(\"readonly\", \"readonly\");");
		out.println("newCell" + n + "2.append(y)");
		//out.println("newCell2.innerText = '"+order_rs[n][17]+"';");
		out.println("var z = document.createElement(\"INPUT\");");
		out.println("z.setAttribute(\"type\", \"text\");");
		out.println("z.setAttribute(\"class\", \"table-input-style\");");
		out.println("z.setAttribute(\"name\", \"memnumber" + n + "\");");
		out.println("z.setAttribute(\"id\", \"memnumber" + n + "\");");
		out.println("z.setAttribute(\"value\", \"" + order_rs[n][17] + "\");");
		out.println("z.setAttribute(\"readonly\", \"readonly\");");
		out.println("newCell" + n + "3.append(z)");
		//out.println("newCell3.innerText = '"+order_rs[n][16]+"';");

		out.println("var a = document.createElement(\"INPUT\");");
		out.println("a.setAttribute(\"type\", \"text\");");
		out.println("a.setAttribute(\"class\", \"table-input-style\");");
		out.println("a.setAttribute(\"name\", \"procode" + n + "\");");
		out.println("a.setAttribute(\"id\", \"procode" + n + "\");");
		out.println("a.setAttribute(\"value\", \"" + order_rs[n][7] + "\");");
		out.println("a.setAttribute(\"readonly\", \"readonly\");");
		out.println("newCell" + n + "4.append(a)");
		//out.println("newCell4.innerText = '"+order_rs[n][6]+"';");
		out.println("var b = document.createElement(\"INPUT\");");
		out.println("b.setAttribute(\"type\", \"text\");");
		out.println("b.setAttribute(\"class\", \"table-input-style\");");
		out.println("b.setAttribute(\"name\", \"proname" + n + "\");");
		out.println("b.setAttribute(\"id\", \"proname" + n + "\");");
		out.println("b.setAttribute(\"value\", \"" + order_rs[n][8] + "\");");
		out.println("b.setAttribute(\"readonly\", \"readonly\");");
		out.println("newCell" + n + "5.append(b)");
		//out.println("newCell5.innerText = '"+order_rs[n][7]+"';");
		out.println("var c = document.createElement(\"INPUT\");");
		out.println("c.setAttribute(\"type\", \"text\");");
		out.println("c.setAttribute(\"class\", \"table-input-style\");");
		out.println("c.setAttribute(\"name\", \"procolor" + n + "\");");
		out.println("c.setAttribute(\"id\", \"procolor" + n + "\");");
		out.println("c.setAttribute(\"value\", \"" + order_rs[n][9] + "\");");
		out.println("c.setAttribute(\"readonly\", \"readonly\");");
		out.println("newCell" + n + "6.append(c)");
		//out.println("newCell6.innerText = '"+order_rs[n][8]+"';");
		out.println("var d = document.createElement(\"INPUT\");");
		out.println("d.setAttribute(\"type\", \"text\");");
		out.println("d.setAttribute(\"class\", \"table-input-style\");");
		out.println("d.setAttribute(\"name\", \"prodan" + n + "\");");
		out.println("d.setAttribute(\"id\", \"prodan" + n + "\");");
		out.println("d.setAttribute(\"value\", \"" + order_rs[n][10] + "\");");
		out.println("d.setAttribute(\"readonly\", \"readonly\");");
		out.println("newCell" + n + "7.append(d)");
		//out.println("newCell7.innerText = '"+order_rs[n][9]+"';");

		out.println("var e = document.createElement(\"INPUT\");");
		out.println("e.setAttribute(\"type\", \"text\");");
		out.println("e.setAttribute(\"class\", \"table-input-style\");");
		out.println("e.setAttribute(\"name\", \"prosu" + n + "\");");
		out.println("e.setAttribute(\"id\", \"prosu" + n + "\");");
		out.println("e.setAttribute(\"value\", \"" + order_rs[n][11].substring(1) + "\");");
		out.println("e.setAttribute(\"readonly\", \"readonly\");");
		out.println("newCell" + n + "8.append(e)");
		//out.println("newCell" + n + "8.innerText = '" + order_rs[n][10] + "';");

		out.println("var f = document.createElement(\"INPUT\");");
		out.println("f.setAttribute(\"type\", \"text\");");
		out.println("f.setAttribute(\"class\", \"table-input-style\");");
		out.println("f.setAttribute(\"name\", \"proprice" + n + "\");");
		out.println("f.setAttribute(\"id\", \"proprice" + n + "\");");
		//out.println("f.setAttribute('onChange', 'chgprice(this.id);');");
		out.println("f.setAttribute(\"value\", \"" + order_rs[n][12] + "\");");
		out.println("f.setAttribute(\"readonly\", \"readonly\");");
		out.println("newCell" + n + "9.append(f)");
		//out.println("newCell" + n + "9.innerText = '" + order_rs[n][11] + "';");
		out.println("var g = document.createElement(\"INPUT\");");
		out.println("g.setAttribute(\"type\", \"text\");");
		out.println("g.setAttribute(\"class\", \"table-input-style\");");
		out.println("g.setAttribute(\"name\", \"orsup" + n + "\");");
		out.println("g.setAttribute(\"id\", \"orsup" + n + "\");");
		out.println("g.setAttribute(\"value\", \"" + order_rs[n][13].substring(1) + "\");");
		out.println("g.setAttribute(\"readonly\", \"readonly\");");
		out.println("newCell" + n + "10.append(g)");
		//out.println("newCell" + n + "10.innerText = '" + order_rs[n][12] + "';");
		out.println("var h = document.createElement(\"INPUT\");");
		out.println("h.setAttribute(\"type\", \"text\");");
		out.println("h.setAttribute(\"class\", \"table-input-style\");");
		out.println("h.setAttribute(\"name\", \"orvat" + n + "\");");
		out.println("h.setAttribute(\"id\", \"orvat" + n + "\");");
		out.println("h.setAttribute(\"value\", \"" + order_rs[n][14].substring(1) + "\");");
		out.println("h.setAttribute(\"readonly\", \"readonly\");");
		out.println("newCell" + n + "11.append(h)");
		//out.println("newCell" + n + "11.innerText = '" + order_rs[n][13] + "';");
		out.println("var i = document.createElement(\"INPUT\");");
		out.println("i.setAttribute(\"type\", \"text\");");
		out.println("i.setAttribute(\"class\", \"table-input-style\");");
		out.println("i.setAttribute(\"name\", \"orall" + n + "\");");
		out.println("i.setAttribute(\"id\", \"orall" + n + "\");");
		out.println("i.setAttribute(\"value\", \"" + order_rs[n][15].substring(1) + "\");");
		out.println("i.setAttribute(\"readonly\", \"readonly\");");
		out.println("newCell" + n + "12.append(i)");
		//out.println("newCell" + n + "12.innerText = '" + order_rs[n][14] + "';");

		out.println("var j = document.createElement(\"INPUT\");");
		out.println("j.setAttribute(\"type\", \"text\");");
		out.println("j.setAttribute(\"class\", \"table-input-style\");");
		out.println("j.setAttribute(\"name\", \"onote" + n + "\");");
		out.println("j.setAttribute(\"id\", \"onote" + n + "\");");
		//out.println("j.setAttribute(\"value\", \"" + total + "\");");
		out.println("j.setAttribute(\"value\", \"예외 출고\");");
		out.println("j.setAttribute(\"readonly\", \"readonly\");");
		out.println("newCell" + n + "13.append(j)");
		//out.println("newCell" + n + "13.innerText = '" + total + "';");

	}
	out.println("window.close();");
	out.println("</script>");

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
/*String ju = "\"MJF_SalesRegistration.jsp\"";

out.println("<script type='text/javascript'>");
out.println("opener.document.getElementById('ordernumber').value ='" + num + "';");
out.println("opener.document.getElementById('orderda').value ='" + da + "';");
out.println("opener.document.getElementById('orderacc').value ='" + acc + "';");
out.println("opener.document.getElementById('orderaccnum').value ='" + orderaccnum + "';");
out.println("opener.document.getElementById('detail').value ='" + num + "';");
out.println("const table = opener.document.getElementById('orderlist');");
// 새 행(Row) 추가
out.println("const newRow = table.insertRow();");

// 새 행(Row)에 Cell 추가
out.println("const newCell1 = newRow.insertCell(0);");
out.println("const newCell2 = newRow.insertCell(1);");

// Cell에 텍스트 추가
out.println("var x = document.createElement(\"INPUT\");");
out.println("x.setAttribute(\"type\", \"checkbox\");");
out.println("x.setAttribute(\"class\", \"table-input-style\");");
out.println("x.setAttribute(\"name\", \"ch\");");
out.println("x.setAttribute(\"value\", \"hihih\");");
out.println("newCell1.append(x)");
out.println("newCell2.innerText = 'New Fruit';");


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
out.println("form.submit();");

out.println("window.close();");
out.println("</script>");*/
%>
<head>
<meta charset="UTF-8">
<%-- <script type="text/javascript">
	opener.document.getElementById('ordernum').value = <%= numm+"-" %>;
	window.close();
</script> --%>
<script>
	function chgprice() {
		//var id = obj;
		//alert(id);
		alert("ridkdkd");
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<input type="text" id="suju" name="suju" value="<%=sujunum%>" readonly>

</body>
</html>