<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%
String salenum = request.getParameter("rdch");
String val_str = request.getParameter("btn_val");
System.out.println(salenum+val_str);
%>
<script>

function load(){
	var str = "<%=val_str%>";
	if(str=='세금'){
		var sst = window.open('bill.jsp?val=<%=salenum%>','popwin','top='+((screen.availHeight )/2) +', left='+(screen.availWidth )/4+', width='+screen.availWidth/2+', height='+screen.availHeight+', toolbar=0, directories=0, status=0, menubar=0, scrollbars=0, resizable=0');
	  	if(sst){
	    	sst.focus();
	  	}
	}else if(str==='거래'){
		var sst = window.open('trading.jsp?val=<%=salenum%>','popwin','top='+((screen.availHeight )/2) +', left='+(screen.availWidth )/4+', width='+screen.availWidth/2+', height='+screen.availHeight+', toolbar=0, directories=0, status=0, menubar=0, scrollbars=0, resizable=0');
	  	if(sst){
	    	sst.focus();
	  	}
	}
	
	window.history.back()
}

</script>
</head>
<body onload=load()>

</body>
</html>