<%@page import="ge.iauto.server.model.Car"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>www.IAuto.ge</title>

<style>
.table {
	height: 15px;
}

.table td {
	list-style: none;
	display: inline;
}

.table td a {
	background: #66CCFF;
	padding: 3px 17px;
	color: black;
	font-family: 'Helvetica Neue', sans-serif;
	font-size: 17px;
	border-radius: 4px;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border: 0px solid rgb(213, 150, 17);
	cursor: pointer;
	background-color: rgb(140, 140, 140);
}

.table td a:hover {
	background-color: #3399FF;
	color: white;
}

.readMore {
	text-decoration: none;
	color: grey
}
.readMore:HOVER {
	text-decoration: none;
	color: #3399FF;
}
.mainTable {
	margin-top: 10px;
	width: 600px;
	background-color: rgb(240,240,240);
	box-shadow: 0 0 12px #AAAAAA;
	border-radius: 7px;
}
</style>

</head>
<body background="bg.png">
<%
		if(request.getSession().getAttribute("user")==null){
			request.getRequestDispatcher("log-in.jsp").forward(request, response);
		}else{
	%>
	<table style="margin: auto;">
		<tr>
			<td>
				<%@include file="menu-bar.jsp"%>
			</td>
		</tr>
		<tr>
			<td>
				<%@include file="search-table.jsp"%>
			</td>
		</tr>
		<tr>
			<td align="left">
				<table class="mainTable">
					<%
					@SuppressWarnings("unchecked")
					List<Car> list = (List<Car>)request.getAttribute("myCars");
					for(int i = 0 ; i < list.size() ; i++){	
						Car c = list.get(i);
					%>
					<tr>
						<td>
							<div style="background-image: url(top-line.jpg); background-size: 100%; height: 5px; width: 600px;"></div>
							<table height="110px" width="600px" bgcolor="#F8F8F8">
								<tr>
									<td width="5%">
										<a href="ShowCar?id=<%=c.getId()%>"><img src="ImageServlet?id=<%=c.getId()%>&photoId=photo1" height="96" width="128" border="0"></a>		
									</td>
									<td width="95%">
										<table width="100%" style="font-size: 10pt;">
											<tr>
												<td>
													<%=c.getCarmake().getName() + " " + c.getCarmodel().getName() + " - "%>
													<font color="red"><%=c.getPrice() + c.getCurrency()%></font>
												</td>
											</tr>
											<tr>
												<td>
													<%=c.getYear() + " წ. " + c.getEngine() + ", " + c.getFuel() + ", " + c.getGearbox() + ", "%>
													<%
													if (c.isRightsteeringwheel()) out.println("მარჯვენა საჭე, ");
													else out.println("მარცხენა საჭე, ");
													%>
													<%=c.getKilometer() + ", " + c.getLocation().getName()%>
												</td>
											</tr>
											  <tr>
												<td align="right">
													<a class="readMore" href="ShowCar?id=<%=c.getId()%>">სრულიად ნახვა  <img alt="read-more" src="read-more.png" width="14px" height="14px" border="0px"></a>
												</td>
												<td align="right">
													<a class="readMore" href="EditCarServlet?id=<%=c.getId()%>"><img alt="read-more" src="edit.png" width="16px" height="16px" border="0px"></a>
												</td>
												<td align="right">
													<a class="readMore" href="DeleteCarServlet?id=<%=c.getId()%>"><img alt="read-more" src="delete.png" width="16px" height="16px" border="0px"></a>
												</td>
												</tr>
										</table>
									</td>
								</tr>
							</table>				
						</td>
					</tr>
					<tr><td><div style="height: 10px;"></div></td></tr>
				<%}%>
				</table>
				<table style="margin-top: 20px; margin-left: 215px;">
					<tr class="table">
						<%
						String Page = request.getParameter("page");
						System.out.println("akane tru shemevida:  " + Page);
						Integer prewPage = Integer.parseInt(Page)-1;
						Integer nextPage = Integer.parseInt(Page)+1;
						if(list.size() != 0){
							if(prewPage<=0 && 11 > list.size()){
							%>
								<td><a>&lt; უკან</a></td>
								<td><a>წინ &gt;</a></td>
							<%}else if(prewPage<=0){%>
								<td><a>&lt; უკან</a></td>
								<td><a href="SearchServlet?page=<%=nextPage%>">წინ &gt;</a></td>
							<%}else if(11 > list.size()){%>
								<td><a href="SearchServlet?page=<%=prewPage%>"></a>&lt; უკან</td>
								<td><a>წინ &gt;</a></td>
							<%}else{%>
								<td><a id="prew" href="SearchServlet?page=<%=prewPage%>">&lt; უკან</a></td>
								<td><a id="next" href="SearchServlet?page=<%=nextPage%>">წინ &gt;</a></td>			
							<%}%>
						<%}%>
					</tr>
				</table>
			</td>
		</tr>		
	</table>
	<%}%>
</body>
</html>