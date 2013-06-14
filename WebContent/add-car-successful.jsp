<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
		if(request.getSession().getAttribute("user")==null){
			request.getRequestDispatcher("log-in.jsp").forward(request, response);
		}else{
	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>added successfully</title>
</head>
<body background="bg.png">
	<%@include file="my-page.jsp"%>
	<table align="center">
		<tr>
			<td>
				<p style="color: blue; font-size: 14;">Application added successfully</p>
			</td>
		</tr>
	</table>
</body>
</html>
<%}%>