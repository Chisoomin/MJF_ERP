<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
	
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="./image/logo_rmbg.png">
<%
String salenum = request.getParameter("val");
System.out.println(salenum);
Connection conn = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
ResultSet rs2 = null;
ResultSet rs3 = null;
String result2[] = new String[22];
int columnCount = 0;
int rowCount = 0;

String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);
%>
<title>�ŷ����� �μ�</title>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.tg {
	border-collapse: collapse;
	border-color: #ccc;
	border-spacing: 0;
	width: 100%;
	table-layout: fixed;
}

.tg td {
	background-color: #fff;
	border-color: #ccc;
	border-style: solid;
	border-width: 1px;
	color: #333;
	font-family: Arial, sans-serif;
	font-size: 14px;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg th {
	background-color: #f0f0f0;
	border-color: #ccc;
	border-style: solid;
	border-width: 1px;
	color: #333;
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg .tg-baqh {
	text-align: center;
	vertical-align: middle;
}

.tg .tg-5frq {
	font-style: italic;
	text-align: center;
	vertical-align: top
}

.tg .tg-nrix {
	text-align: center;
	vertical-align: middle
}

.table-input-style {
	width: 100%;
	border: 0;
	outline: none;
	text-align: center;
}

h1, h2, h3, h4, h5, dl, dt, dd, ul, li, ol, th, td, p, blockquote, form,
	fieldset, legend, div, body {
	-webkit-print-color-adjust: exact;
}

.hi {
	-webkit-print-color-adjust: exact;
	width: 210mm;
	height: 297mm;
	background-repeat: no-repeat;
	background-size: 210mm 297mm;
	background-image: url('./image/trading_pic.png');
}

</style>
</head>
<body>
	<div class="hi">
	<%
		try {
			String sql = "SELECT * from MJFdb.sales_table where order_num='" + salenum + "'";
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(sql);

			ResultSetMetaData rsmd = rs.getMetaData();
			columnCount = rsmd.getColumnCount();
			rs.last(); //Ŀ���� ��ġ�� ���� �ڷ� �̵�
			rowCount = rs.getRow(); //���� Ŀ���� Row Index ���� ����
			String sale_rs[][] = new String[rowCount][columnCount];
			int i = 0;
			int j = 0;
			rs.first();
			for (i = 0; i < rowCount; i++) {
				for (j = 0; j < columnCount; j++) {
					sale_rs[i][j] = rs.getString((j + 1));
				}
				rs.next();
			}
			
			out.println("<div style=\"position: absolute; left: 367px; top: 62px;\">"+sale_rs[0][4]+"</div>");
			out.println("<div style=\"position: absolute; left: 531px; top: 62px;\">"+sale_rs[0][1]+"</div>");
			out.println("<div style=\"position: absolute; left: 397px; top: 87.5px;\">010-1234-4321</div>");
			//����, no, ������ ����ó
			
			out.println("<div style=\"position: absolute; left: 148px; top: 113px;\">110-87-77775</div>");			
			out.println("<div style=\"position: absolute; left: 98px; top: 138.5px;\">���� ����</div>");
			out.println("<div style=\"position: absolute; left: 290px; top: 138.5px;\">������</div>");
			out.println("<div style=\"position: absolute; left: 98px; top: 164.5px;\">����Ư���� ���빮�� ���·� 134</div>");
			out.println("<div style=\"position: absolute; left: 98px; top: 191px;\">���Ҹ�</div>");
			out.println("<div style=\"position: absolute; left: 290px; top: 191px;\">����, ������</div>");
			//������ ����
			
			
			String sql2 = "SELECT * from MJFdb.account_table where account_name='"+sale_rs[0][6]+"'";
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs2 = stmt.executeQuery(sql2);
			ResultSetMetaData rsmd2 = rs2.getMetaData();
			int columnCount2 = rsmd2.getColumnCount();
			int k = 0;
			rs2.first();
			for (k = 0; k < columnCount2; k++) {
				result2[k] = rs2.getString(k+1);
			}	
			out.println("<div style=\"position: absolute; left: 527px; top: 113px;\">"+sale_rs[0][5]+"</div>");
			out.println("<div style=\"position: absolute; left: 474px; top: 138.5px;\">"+sale_rs[0][6]+"</div>");
			out.println("<div style=\"position: absolute; left: 640px; top: 138.5px;\">"+result2[2]+"</div>");
			out.println("<div style=\"word-break:break-all; width:300px; font-size:12px; position: absolute; left: 474px; top: 168.5px;\">"+result2[7]+"</div>");
			out.println("<div style=\"position: absolute; left: 474px; top: 191px;\">"+result2[13]+"</div>");
			out.println("<div style=\"position: absolute; left: 640px; top: 191px;\">"+result2[14]+"</div>");
			//���޹޴��� ����
			
			String sql3 = "SELECT product_measure, product_size from MJFdb.product_table where product_name='"+sale_rs[0][8]+"'";
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs3 = stmt.executeQuery(sql3);
			ResultSetMetaData rsmd3 = rs3.getMetaData();
			int columnCount3 = rsmd3.getColumnCount();
			int l = 0;
			rs3.first();
			String result3[]=new String[2];
			for (l = 0; l < columnCount3; l++) {
				result3[l] = rs3.getString(l+1);
			}
			out.println(
					"<div style=\"position: absolute; left: 41px; top: 241px;\">"+sale_rs[0][4].substring(5)+"</div>");
			out.println("<div style=\"width:125px; word-break:break-all; font-size:12px; position: absolute; left: 96px; top: 245px;\">"+sale_rs[0][8]+" / "+result3[1]+"</div>");
			out.println("<div style=\"position: absolute; left: 230px; top: 241px;\">"+result3[0]+"</div>");
			out.println("<div style=\"position: absolute; left: 288px; top: 241px;\">"+sale_rs[0][11]+"</div>");
			out.println("<div style=\"position: absolute; left: 341px; top: 241px;\">"+sale_rs[0][12]+"</div>");
			out.println("<div style=\"position: absolute; left: 420px; top: 241px;\">"+sale_rs[0][13]+"</div>");
			out.println("<div style=\"position: absolute; left: 556px; top: 241px;\">"+sale_rs[0][14]+"</div>");
			//����, ǰ��/�԰�, ���� ����, �ܰ�, ���ް���, ����, ���/�հ�
			
			out.println("<div style=\"position: absolute; left: 98px; top: 500px;\">"+sale_rs[0][15]+"</div>");
			//�հ�
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			out.println("<div style=\"position: absolute; left: 367px; top: 617px;\">"+sale_rs[0][4]+"</div>");
			out.println("<div style=\"position: absolute; left: 531px; top: 617px;\">"+sale_rs[0][1]+"</div>");
			out.println("<div style=\"position: absolute; left: 397px; top: 642.5px;\">010-1234-4321</div>");
			//����, no, ������ ����ó
			
			out.println("<div style=\"position: absolute; left: 148px; top: 668px;\">110-87-77775</div>");			
			out.println("<div style=\"position: absolute; left: 98px; top: 693.5px;\">���� ����</div>");
			out.println("<div style=\"position: absolute; left: 290px; top: 693.5px;\">������</div>");
			out.println("<div style=\"position: absolute; left: 98px; top: 719.5px;\">����Ư���� ���빮�� ���·� 134</div>");
			out.println("<div style=\"position: absolute; left: 98px; top: 746px;\">���Ҹ�</div>");
			out.println("<div style=\"position: absolute; left: 290px; top: 746px;\">����, ������</div>");
			//������ ����
				
			out.println("<div style=\"position: absolute; left: 527px; top: 668px;\">"+sale_rs[0][5]+"</div>");
			out.println("<div style=\"position: absolute; left: 474px; top: 693.5px;\">"+sale_rs[0][6]+"</div>");
			out.println("<div style=\"position: absolute; left: 640px; top: 693.5px;\">"+result2[2]+"</div>");
			out.println("<div style=\"word-break:break-all; width:300px; font-size:12px; position: absolute; left: 474px; top: 722.5px;\">"+result2[7]+"</div>");
			out.println("<div style=\"position: absolute; left: 474px; top: 746px;\">"+result2[13]+"</div>");
			out.println("<div style=\"position: absolute; left: 640px; top: 746px;\">"+result2[14]+"</div>");
			//���޹޴��� ����
			
			out.println(
					"<div style=\"position: absolute; left: 41px; top: 797px;\">"+sale_rs[0][4].substring(5)+"</div>");
			out.println("<div style=\"width:125px; word-break:break-all; font-size:12px; position: absolute; left: 96px; top: 801px;\">"+sale_rs[0][8]+" / "+result3[1]+"</div>");
			out.println("<div style=\"position: absolute; left: 230px; top: 797px;\">"+result3[0]+"</div>");
			out.println("<div style=\"position: absolute; left: 288px; top: 797px;\">"+sale_rs[0][11]+"</div>");
			out.println("<div style=\"position: absolute; left: 341px; top: 797px;\">"+sale_rs[0][12]+"</div>");
			out.println("<div style=\"position: absolute; left: 420px; top: 797px;\">"+sale_rs[0][13]+"</div>");
			out.println("<div style=\"position: absolute; left: 556px; top: 797px;\">"+sale_rs[0][14]+"</div>");
			//����, ǰ��/�԰�, ���� ����, �ܰ�, ���ް���, ����, ���/�հ�
			
			out.println("<div style=\"position: absolute; left: 98px; top: 1055px;\">"+sale_rs[0][15]+"</div>");
			//�հ�
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
	%>
	</div>
	<!--<table class="tg">
		<tbody>
			<tr>
				<td colspan="5">[���� ��11ȣ ����]</td>
				<td colspan="27"></td>
			</tr>

			<tr>
				<td rowspan="2" colspan="15">�� �� �� �� ��</td>
				<td rowspan="2">(</td>
				<td colspan="5">���޹޴���</td>
				<td rowspan="2">)</td>
				<td colspan="4">å �� ȣ</td>
				<td></td>
				<td></td>
				<td>��</td>
				<td></td>
				<td></td>
				<td>ȣ</td>
			</tr>

			<tr>
				<td colspan="5">�� �� ��</td>
				<td colspan="4">�� �� �� ȣ</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
		<tbody>
			<tr>
				<td rowspan="8">�� �� ��</td>
				<td colspan="3" rowspan="2">��Ϲ�ȣ</td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2">-</td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2">-</td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="8">���޹޴���</td>
				<td colspan="3" rowspan="2">��Ϲ�ȣ</td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2">-</td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2">-</td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
			</tr>

			<tr>
				<td colspan="3">�� ȣ</td>
				<td rowspan="2" colspan="6"></td>
				<td rowspan="2">����</td>
				<td rowspan="2" colspan="4"></td>
				<td rowspan="2">��</td>
				<td colspan="3">�� ȣ</td>
				<td rowspan="2" colspan="6"></td>
				<td rowspan="2">����</td>
				<td rowspan="2" colspan="4"></td>
				<td rowspan="2">��</td>
			</tr>

			<tr>
				<td colspan="3">(���θ�)</td>
				<td colspan="3">(���θ�)</td>
			</tr>



			<tr>
				<td colspan="3">�� ȣ</td>
				<td rowspan="2" colspan="6"></td>
				<td rowspan="2">����</td>
				<td rowspan="2" colspan="4"></td>
				<td rowspan="2">��</td>
				<td colspan="3">�� ȣ</td>
				<td rowspan="2" colspan="6"></td>
				<td rowspan="2">����</td>
				<td rowspan="2" colspan="4"></td>
				<td rowspan="2">��</td>
			</tr>
			<tr>
				<td colspan="3">(���θ�)</td>
				<td colspan="3">(���θ�)</td>
			</tr>

			<tr>
				<td colspan="3">�� ȣ</td>
				<td rowspan="2" colspan="6"></td>
				<td rowspan="2">����</td>
				<td rowspan="2" colspan="4"></td>
				<td rowspan="2">��</td>
				<td colspan="3">�� ȣ</td>
				<td rowspan="2" colspan="6"></td>
				<td rowspan="2">����</td>
				<td rowspan="2" colspan="4"></td>
				<td rowspan="2">��</td>
			</tr>
			<tr>
				<td colspan="3">(���θ�)</td>
				<td colspan="3">(���θ�)</td>
			</tr>
		</tbody>

		<tr>
			<td colspan="4">�� ��</td>
			<td colspan="13">�� �� �� ��</td>
			<td colspan="10">�� ��</td>
			<td colspan="5">�� ��</td>
		</tr>

	</table>  -->
	<input type="button" value="�μ��ϱ�" id="print" onclick="toggleBtn1()" />

</body>
<script>
function toggleBtn1() {
	  
	  // ��� �� ��ư ���� (btn1)
	  const btn1 = document.getElementById('print');
	  
	  // btn1 ����� (display: none)
	  if(btn1.style.display !== 'none') {
	    btn1.style.display = 'none';
	  }
	  window.print();
	  window.close();
	  
}

var prtContent; // ����Ʈ �ϰ� ���� ����
var initBody;  // body ���� ����

// ����Ʈ�ϰ� ���� ������ id ���� ���� ��� ����
function startPrint (div_id) {
	prtContent = document.getElementById(div_id);
	window.onbeforeprint = beforePrint;
	window.onafterprint = afterPrint;
	window.print();
}

// �������� body ������ ����Ʈ�ϰ� ���� �������� ��ü
function beforePrint(){
	initBody = document.body.innerHTML;
	document.body.innerHTML = prtContent.innerHTML;
}

// ����Ʈ ��, �������� body ����
function afterPrint(){
	document.body.innerHTML = initBody;
}

</script>
</html>