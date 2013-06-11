<%@page import="ge.iauto.server.model.Car"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>www.IAuto.ge</title>
</head>
<body background="bg.png">
	<%@include file="menu-bar.jsp"%>
	<%@include file="search-table.jsp"%>
	<table align="center">
		<%
		List<Car> list = (List<Car>)request.getAttribute("carList");
		for(int i = 0 ; i < list.size() ; i++){	
		%>
			<tr><td><a href="ShowCar?id="+<%=list.get(i).getId()%>><img src="data:image/png;base64,"+<%=list.get(i).getPhoto1()%>></a></td></tr>
		<%
		}
		%>
	</table>
</body>
</html>