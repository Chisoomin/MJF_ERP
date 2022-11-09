<%@page import="jxl.read.biff.BiffException"%>
<%@ page language="java"
	contentType="text/html; charset=EUC-KR"
	isErrorPage="true" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*, java.io.*, jxl.*, java.util.*"%>
<%
	String path = "G:\\MJF_ERP";
	String filename = "taxbill.xls";
	Workbook workbook = Workbook.getWorkbook(new File("G:\\MJF_ERP\\taxbill2.xlsx"));
	Sheet sheet = workbook.getSheet(0);
	int col = sheet.getColumns();  // 시트의 컬럼의 수를 반환한다.
	System.out.println("col"+col);
	int row = sheet.getRows();  // 시트의 열의 수를 반환한다.
	System.out.println("row"+row);
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


	<%
		 try {
			 
			 int tmpCellLen=0;
			 for(int i=0;i<row;i++){
				 Cell cell[] = sheet.getRow(i);
				 tmpCellLen=cell.length;
				 out.println("<tr>");
				 for(int j=0;j<col;j++){
					 if(j<tmpCellLen){
						 out.println("<td>"+cell[j].getContents()+"</td>");
					 }else{
						 out.println("<td>"+"</td>");
					 }
				 }
				 out.println("</tr>");
			 }
	
		 
	     } catch (FileNotFoundException e) {
	         e.printStackTrace();
	     } catch (IOException e) {
	         e.printStackTrace();
	     }finally{
	    	 
	     }
		
	%>

</body>
</html>