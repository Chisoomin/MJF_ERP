<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.Enumeration"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<%! static int sun=1; %>
<%
Connection conn = null;
Statement stmt = null;
PreparedStatement pstmt = null;
PreparedStatement pstmt2 = null;
PreparedStatement pstmt3 = null;
ResultSet rs = null;
int columnCount = 0;
int rowCount = 0;
String sujunum = request.getParameter("ordernumber");
String sujunum_ban = request.getParameter("ordernumber_ban");

String all = request.getParameter("orall-1");
String saledate = request.getParameter("salesdate");
String saledate_ban = request.getParameter("salesdate_ban");
String note = request.getParameter("onote0");
String note_ban = request.getParameter("onote_ban0");
if(saledate!=null){
	saledate = saledate.replaceAll("-", "");
}
if(saledate_ban!=null){
	saledate_ban = saledate_ban.replaceAll("-", "");
}

String[] ch_num = request.getParameterValues("ch");
String[] ch_num_ban = request.getParameterValues("ch_ban");
if(ch_num==null){
	for(int i=0;i<ch_num_ban.length;i++){
		System.out.println(ch_num_ban[i]+"!!!!!!!!!!!!!!!!!!!"+note);
	}
}else if(ch_num_ban==null){
	for(int i=0;i<ch_num.length;i++){
		System.out.println(ch_num[i]+"!!!!!!!!!!!!!!!!!!!"+note);
	}
}


//String num=null,da=null, date=null, acc=null, code=null, name=null, me=null, qu=null, pp=null, sp=null, orderaccnum=null;


String url = "jdbc:mysql://mjfdb-aws.cxswvbzpdoox.ap-northeast-1.rds.amazonaws.com/MJFdb";
String user = "MJFdbRoot";
String password = "mjfrootpw";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);
if(ch_num_ban==null&&ch_num!=null){
	if(note==""){
		/*out.println("<script>");
	    out.println("alert('일반 매출 등록');");
	    out.println("</script>");*/
	    try {
	    	String sql = "SELECT * from MJFdb.order_table where order_num='"+sujunum+"'";
	    	String sql2="";
	    	String sql3="";
	    	String sql4 = "";


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
	    	String taxbillcode=saledate+"-42000000-0000000"+sun; //수정
	    	sun++;
	    	for(int l=0;l<ch_num.length-1;l++){
	    		pstmt = conn.prepareStatement("insert into sales_table (order_num, order_date, delivery_date, sales_date, account_code, account_name,product_code,product_name,product_color,product_measure,product_quantity,product_price,supply_price,vat,total_price,total_amount,member_id,member_name,tading_code,taxbill_code) " + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	    		pstmt.setString(1, order_rs[Integer.parseInt(ch_num[l+1])][1]);
	    		pstmt.setString(2, order_rs[Integer.parseInt(ch_num[l+1])][2]);
	    		pstmt.setString(3, order_rs[Integer.parseInt(ch_num[l+1])][3]);
	    		pstmt.setString(4, saledate);
	    		pstmt.setString(5, order_rs[Integer.parseInt(ch_num[l+1])][4]);
	    		pstmt.setString(6, order_rs[Integer.parseInt(ch_num[l+1])][5]);
	    		pstmt.setString(7, order_rs[Integer.parseInt(ch_num[l+1])][6]);
	    		pstmt.setString(8, order_rs[Integer.parseInt(ch_num[l+1])][7]);
	    		pstmt.setString(9, order_rs[Integer.parseInt(ch_num[l+1])][8]);
	    		pstmt.setString(10, order_rs[Integer.parseInt(ch_num[l+1])][9]);
	    		pstmt.setString(11, order_rs[Integer.parseInt(ch_num[l+1])][10]);
	    		
	    		pstmt.setString(12, request.getParameter("proprice"+ch_num[l+1]));
	    		pstmt.setString(13, request.getParameter("orsup"+ch_num[l+1]));
	    		pstmt.setString(14, request.getParameter("orvat"+ch_num[l+1]));
	    		pstmt.setString(15, request.getParameter("orall"+ch_num[l+1]));
	    		int allhap =0;
	    		for(int m=0;m<ch_num.length-1;m++){
	    			allhap = allhap + Integer.parseInt(request.getParameter("orall"+ch_num[m+1]));
	    		}
	    		pstmt.setString(16, String.valueOf(allhap));
	    		
	    		pstmt.setString(17, order_rs[Integer.parseInt(ch_num[l+1])][16]);
	    		pstmt.setString(18, order_rs[Integer.parseInt(ch_num[l+1])][17]);
	    		pstmt.setString(19, order_rs[Integer.parseInt(ch_num[l+1])][1]);
	    		pstmt.setString(20, taxbillcode);
	    		pstmt.executeUpdate();
	    		
	    		sql2 = "UPDATE order_table SET order_progress=? WHERE order_num=? AND product_code=?";
	    		pstmt2=conn.prepareStatement(sql2);
	    		pstmt2.setString(1, "완료");
	    		pstmt2.setString(2, sujunum);
	    		pstmt2.setString(3, order_rs[Integer.parseInt(ch_num[l+1])][6]);
	    		pstmt2.executeUpdate();
	    		
	    		
	    		sql3 = "UPDATE product_table SET product_amount=product_amount-? WHERE product_name=?";
	    		pstmt3=conn.prepareStatement(sql3);
	    		pstmt3.setInt(1, Integer.parseInt(request.getParameter("prosu"+ch_num[l+1])));
	    		pstmt3.setString(2, order_rs[Integer.parseInt(ch_num[l+1])][7]);
	    		pstmt3.executeUpdate();
	    	}
	    	
	    	
	    	
	    	out.println("<script>alert('정상적으로 매출 등록되었습니다.'); document.location.href='MJF_Layout.jsp?pageChange=MJF_SalesRegistration2.jsp';</script>");
	    	//response.sendRedirect("MJF_Layout.jsp?pageChange=MJF_SalesRegistration2.jsp");

	    	

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
	}else if(note!=""){
		/*out.println("<script>");
	    out.println("alert('예외 출고 매출 등록');");
	    out.println("</script>");*/
	    try {
	    	String sql = "SELECT * from MJFdb.sales_table where order_num='"+sujunum+"' and sales_note='반품'";
	    	String sql2="";
	    	String sql3="";
	    	String sql4 = "";


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
	    	String taxbillcode=saledate+"-42000000-0000000"+sun; //수정
	    	sun++;
	    	for(int l=0;l<ch_num.length-1;l++){
	    		pstmt = conn.prepareStatement("insert into sales_table (order_num, order_date, delivery_date, sales_date, account_code, account_name,product_code,product_name,product_color,product_measure,product_quantity,product_price,supply_price,vat,total_price,total_amount,member_id,member_name,tading_code,taxbill_code, return_date, sales_note) " + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	    		pstmt.setString(1, order_rs[Integer.parseInt(ch_num[l+1])][1]);
	    		pstmt.setString(2, order_rs[Integer.parseInt(ch_num[l+1])][2]);
	    		pstmt.setString(3, order_rs[Integer.parseInt(ch_num[l+1])][3]);
	    		pstmt.setString(4, saledate);
	    		pstmt.setString(5, order_rs[Integer.parseInt(ch_num[l+1])][5]);
	    		pstmt.setString(6, order_rs[Integer.parseInt(ch_num[l+1])][6]);
	    		pstmt.setString(7, order_rs[Integer.parseInt(ch_num[l+1])][7]);
	    		pstmt.setString(8, order_rs[Integer.parseInt(ch_num[l+1])][8]);
	    		pstmt.setString(9, order_rs[Integer.parseInt(ch_num[l+1])][9]);
	    		pstmt.setString(10, order_rs[Integer.parseInt(ch_num[l+1])][10]);
	    		pstmt.setInt(11, -Integer.parseInt(order_rs[Integer.parseInt(ch_num[l+1])][11]));
	    		
	    		pstmt.setString(12, request.getParameter("proprice"+ch_num[l+1]));
	    		pstmt.setString(13, request.getParameter("orsup"+ch_num[l+1]));
	    		pstmt.setString(14, request.getParameter("orvat"+ch_num[l+1]));
	    		pstmt.setString(15, request.getParameter("orall"+ch_num[l+1]));
	    		int allhap =0;
	    		for(int m=0;m<ch_num.length-1;m++){
	    			allhap = allhap + Integer.parseInt(request.getParameter("orall"+ch_num[m+1]));
	    		}
	    		pstmt.setString(16, String.valueOf(allhap));
	    		
	    		pstmt.setString(17, order_rs[Integer.parseInt(ch_num[l+1])][17]);
	    		pstmt.setString(18, order_rs[Integer.parseInt(ch_num[l+1])][18]);
	    		pstmt.setString(19, order_rs[Integer.parseInt(ch_num[l+1])][1]+"-1");
	    		pstmt.setString(20, taxbillcode);
	    		pstmt.setString(21, order_rs[Integer.parseInt(ch_num[l+1])][21]);
	    		pstmt.setString(22, request.getParameter("onote"+ch_num[l+1]));
	    		pstmt.executeUpdate();
	    		
	    		/*sql2 = "insert into return_product(return_code, return_name, return_amount) values(?,?,?)";
	    		pstmt2=conn.prepareStatement(sql2);
	    		pstmt2.setString(1, order_rs[Integer.parseInt(ch_num[l+1])][6]);
	    		pstmt2.setString(2, order_rs[Integer.parseInt(ch_num[l+1])][7]);
	    		pstmt2.setString(3, order_rs[Integer.parseInt(ch_num[l+1])][10]);
	    		pstmt2.executeUpdate();*/
	    		
	    		
	    		sql3 = "UPDATE product_table SET product_amount=product_amount-? WHERE product_name=?";
	    		pstmt3=conn.prepareStatement(sql3);
	    		pstmt3.setInt(1, Integer.parseInt(request.getParameter("prosu"+ch_num[l+1])));
	    		pstmt3.setString(2, order_rs[Integer.parseInt(ch_num[l+1])][7]);
	    		pstmt3.executeUpdate();
	    		
	    		sql2 = "UPDATE sales_table SET sales_note='반품(예외출고 완료)' WHERE order_num=? and sales_note='반품'";
	    		pstmt2=conn.prepareStatement(sql2);
	    		pstmt2.setString(1, order_rs[Integer.parseInt(ch_num[l+1])][1]);
	    		pstmt2.executeUpdate();
	    	}
	    	
	    	
	    	out.println("<script>alert('정상적으로 예외 출고 등록되었습니다.'); document.location.href='MJF_Layout.jsp?pageChange=MJF_SalesRegistration2.jsp';</script>");
	    	//response.sendRedirect("MJF_Layout.jsp?pageChange=MJF_SalesRegistration2.jsp");

	    	

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
	}
}else if(ch_num_ban!=null&&ch_num==null&&note_ban!=""){
	/*out.println("<script>");
    out.println("alert('반품 등록');");
    out.println("</script>");*/
    try {
    	String sql = "SELECT * from MJFdb.sales_table where order_num='"+sujunum_ban+"'";
    	String sql2="";
    	String sql3="";
    	String sql4 = "";


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
    	String taxbillcode=saledate_ban+"-42000000-0000000"+sun; //수정
    	sun++;
    	for(int l=0;l<ch_num_ban.length-1;l++){
    		pstmt = conn.prepareStatement("insert into sales_table (order_num, order_date, delivery_date, sales_date, account_code, account_name,product_code,product_name,product_color,product_measure,product_quantity,product_price,supply_price,vat,total_price,total_amount,member_id,member_name,taxbill_code,return_date, sales_note, tading_code) " + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
    		pstmt.setString(1, order_rs[Integer.parseInt(ch_num_ban[l+1])][1]);
    		pstmt.setString(2, order_rs[Integer.parseInt(ch_num_ban[l+1])][2]);
    		pstmt.setString(3, order_rs[Integer.parseInt(ch_num_ban[l+1])][3]);
    		pstmt.setString(4, order_rs[Integer.parseInt(ch_num_ban[l+1])][4]);
    		pstmt.setString(5, order_rs[Integer.parseInt(ch_num_ban[l+1])][5]);
    		pstmt.setString(6, order_rs[Integer.parseInt(ch_num_ban[l+1])][6]);
    		pstmt.setString(7, order_rs[Integer.parseInt(ch_num_ban[l+1])][7]);
    		pstmt.setString(8, order_rs[Integer.parseInt(ch_num_ban[l+1])][8]);
    		pstmt.setString(9, order_rs[Integer.parseInt(ch_num_ban[l+1])][9]);
    		pstmt.setString(10, order_rs[Integer.parseInt(ch_num_ban[l+1])][10]);
    		pstmt.setInt(11, -Integer.parseInt(request.getParameter("prosu_ban"+ch_num_ban[l+1])));
    		
    		pstmt.setString(12, request.getParameter("proprice_ban"+ch_num_ban[l+1]));
    		pstmt.setInt(13, -Integer.parseInt(request.getParameter("orsup_ban"+ch_num_ban[l+1])));
    		pstmt.setInt(14, -Integer.parseInt(request.getParameter("orvat_ban"+ch_num_ban[l+1])));
    		pstmt.setInt(15, -Integer.parseInt(request.getParameter("orall_ban"+ch_num_ban[l+1])));
    		int allhap =0;
    		for(int m=0;m<ch_num_ban.length-1;m++){
    			allhap = allhap + Integer.parseInt(request.getParameter("orall_ban"+ch_num_ban[m+1]));
    		}
    		pstmt.setString(16, String.valueOf(-allhap));
    		
    		pstmt.setString(17, order_rs[Integer.parseInt(ch_num_ban[l+1])][17]);
    		pstmt.setString(18, order_rs[Integer.parseInt(ch_num_ban[l+1])][18]);
    		pstmt.setString(19, taxbillcode);
    		pstmt.setString(20, saledate_ban);
    		pstmt.setString(21, request.getParameter("onote_ban"+ch_num_ban[l+1]));
    		pstmt.setString(22, "");
    		pstmt.executeUpdate();
    		
    		sql2 = "insert into return_product(return_code, return_name, return_amount) values(?,?,?)";
    		pstmt2=conn.prepareStatement(sql2);
    		pstmt2.setString(1, order_rs[Integer.parseInt(ch_num_ban[l+1])][7]);
    		pstmt2.setString(2, order_rs[Integer.parseInt(ch_num_ban[l+1])][8]);
    		pstmt2.setInt(3, Integer.parseInt(request.getParameter("prosu_ban"+ch_num_ban[l+1])));
    		pstmt2.executeUpdate();
    		
    		
    		/*sql3 = "UPDATE product_table SET product_amount=product_amount-? WHERE product_name=?";
    		pstmt3=conn.prepareStatement(sql3);
    		pstmt3.setInt(1, Integer.parseInt(request.getParameter("prosu"+ch_num_ban[l+1])));
    		pstmt3.setString(2, order_rs[Integer.parseInt(ch_num_ban[l+1])][7]);
    		pstmt3.executeUpdate();*/
    	}
    	
    
    	
    	out.println("<script>alert('정상적으로 반품 등록되었습니다.'); document.location.href='MJF_Layout.jsp?pageChange=MJF_SalesRegistration2.jsp'; </script>");
    	//response.sendRedirect("MJF_Layout.jsp?pageChange=MJF_SalesRegistration2.jsp");

    	

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
}



out.println("<전체 request.getAttribute 출력>");
out.println("<br/>");
Enumeration attrs = request.getAttributeNames();

while (attrs.hasMoreElements()) {
	String attr = (String) attrs.nextElement();
	out.println(attr + "<br/>");
}

out.println("<br/>");

out.println("<br/>");
out.println("<전제 request.getParameter 출력>");
out.println("<br/>");
Enumeration params = request.getParameterNames();



while (params.hasMoreElements()) {
	String param = (String) params.nextElement();
	out.println("param:" + param + "<br/>");
	String st = request.getParameter(param);
	System.out.println(st);
}
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>