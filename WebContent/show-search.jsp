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
		@SuppressWarnings("unchecked")
		List<Car> list = (List<Car>)request.getAttribute("list");
		for(int i = 0 ; i < list.size() ; i++){	
			Car c = list.get(i);
		%>
			<tr>
				<td>
					<table height=150 width="600" background="show.jpg" align="center">
						<tr>
							<td>
								<a href="ShowCar?id=<%=c.getId()%>"><img src="ImageServlet?photoId=<%=c.getPhoto1()%>&id=<%=c.getId()%>" height="150" width="200" border="0"/></a>		
							</td>	
						</tr>
					</table>				
				</td>
			</tr>
		<%}%>
	</table>
</body>
</html>