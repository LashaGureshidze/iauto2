<%@page import="ge.iauto.server.model.Car"%>
<%@page import="ge.iauto.server.model.CarModel"%>
<%@page import="ge.iauto.server.model.CarMake"%>
<%@page import="ge.iauto.server.model.Category"%>
<%@page import="ge.iauto.server.model.Location"%>
<%@page import="ge.iauto.server.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ge.iauto.server.model.Car"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>IAUTO.ge</title>
</head>

<%
	Car car = (Car)request.getAttribute("carToShow");
%>

<%!
	double count(Car car) {
		int year = car.getYear();
		double motor = car.getEngine() * 1000;
		double aqcis;
		switch (2013 - year) {
		case 0: case 1:
			aqcis = 1.5 * motor;
			break;
		case 2:
			aqcis = 1.4 * motor;
			break;
		case 3:
			aqcis = 1.3 * motor;
			break;
		case 4:
			aqcis = 1.2 * motor;
			break;
		case 5:
			aqcis = 1.0 * motor;
			break;
		case 6:
			aqcis = 0.7 * motor;
			break;
		case 7: case 8: case 9: case 10: case 11: case 12:
			aqcis = 0.5 * motor;
			break;
		case 13:
			aqcis = 0.6 * motor;
			break;
		case 14:
			aqcis = 0.7 * motor;
		default:
			aqcis = 0.8 * motor;
			break;
		}
	
		double importi = (motor / 100 * 0.05) + (year * (motor / 100) * 0.0025);
	
		double sum = aqcis + importi + 72 + 31 + 150;
		return sum;
	}
%>

<style>
.paramTable {
	background-color: white;
	border: 2px solid #D8D8D8;
	box-shadow: 4px 4px 21px -4px #858585;
	text-shadow: rgba(180, 78, 78, 0.22) 0.1em 0.1em 0.2em;
	font-weight: normal;
	margin: auto;
}
</style>

<body>
	<table style="margin-top: 20px; width: 800px;">
		<tr>
			<td>
				<table width="70%">
					<tr>
						<td width="50%">
							<img alt="view" src="view.png">
							<%
								out.print("ნანახია " + car.getViewCount() + "-ჯერ");
							%>
						</td>
						<td width="50%">
							<img alt="location" src="location.png">&nbsp;
							<%
								out.print("მდებარეობა: " + car.getLocation().getName());
							%>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<%
					out.print("<font color='#FF0000' size='+2'>" + car.getPrice() + car.getCurrency() + "</font>   ");
					if (car.isGanbajebuli()) out.print("განბაჟებული");
					else {
						out.print("+ განბაჟება: " + "<font color='#FF0000' size='+1'>" + (int)count((Car)request.getAttribute("carToShow")) + " ლარი</font>");
					}
				%>
			</td>
		</tr>
		<tr height="1">
			<td>
				<hr style="width: 770px; margin-left: 15px; border: none; background-color: rgb(0, 128, 255); height: 1px;">
			</td>
		</tr>
		<tr>
			<td>
				<%
					String st = car.getUsername() + " " + car.getTelephone();
					if (st == null || st.equals(" ")) out.println("მომხმარებელს არ აქვს მითითებული საკონტაქტო ინფორმაცია!");
					else out.println(st);
				%>
			</td>
		</tr>
		<tr height="1">
			<td>
				<hr style="width: 770px; margin-left: 15px; border: none; background-color: rgb(0, 128, 255); height: 1px;">
			</td>
		</tr>
		<tr>
			<td align="left">
				<p><%=car.getDescribtion()%></p>
			</td>
		</tr>
		<tr height="1">
			<td>
				<hr style="width: 770px; margin-left: 15px; border: none; background-color: rgb(0, 128, 255); height: 1px;">
			</td>
		</tr>
	</table>
	<table class="paramTable" style="margin-left: 0px; margin-top: 15px;">
		<tr>
			<td>
				<table>
					<tr>
						<td align="right" style="width: 50%;">
							მწარმოებელი:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getCarmake().getName()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							მოდელი:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getCarmodel().getName()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							გამოშვების წელი:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getYear()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							კატეგორია:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getCategory().getName()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							საწვავის ტიპი:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getFuel()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							ძრავის მოცულობა:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getEngine()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							გარბენი:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getKilometer()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							ცილინდრები:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getCylinder()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							გადაცემათა კოლოფი:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getGearbox()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							წამყვანი თვლები:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getActionwheel()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							კარები:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getDoors()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							საჭე:
						</td>
						<td align="left" style="width: 50%;">
							<%
								if(!car.isRightsteeringwheel())out.print("მარჯვნივ");
								if(car.isRightsteeringwheel()) out.print("მარცხნივ");
							%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							ფერი:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getColor()%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							აირბაგები:
						</td>
						<td align="left" style="width: 50%;">
							<%=car.getAirbag()%>
						</td>
					</tr>
				</table>
			</td>
			<td>
				<table>
					<tr>
						<td align="right" style="width: 50%;">
							ABS:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isAbs()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isAbs()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							ელ.შუშები:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isWindow()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isWindow()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							კონდენციონერი:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isConditioner()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isConditioner()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							კლიმატკონტროლი:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isClimat()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isClimat()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							ტყავის სალონი:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isLeather()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isLeather()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							დისკები:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isWheel()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isWheel()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							ნავიგაცია:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isNavigation()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isNavigation()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							ცენტრალური საკეტი:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isCentrallock()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isCentrallock()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							ლუქი:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isTopwindow()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isTopwindow()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							სიგნალიზაცია:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isSequrity()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isSequrity()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							ბორტკომპიუტერი:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isComputer()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isComputer()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							ჰიდრავლიკა:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isHydraulics()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isHydraulics()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							პარკინგკონტროლი:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isParkcontrol()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isParkcontrol()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
					<tr>
						<td style="width: 500px;" align="center" colspan="2">
							<div style="width: 200px; height: 1px; background-color: rgb(0, 128, 255);"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 50%;">
							ტურბო:
						</td>
						<td align="left" style="width: 50%;">
							<% if(car.isTurbo()){%>
								 <img border="0" src="plus.gif">
								<%}%>
								<% if(!car.isTurbo()) {%>
								<img border="0" src="minus.gif">
							<%}%>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<hr style="height: 75px; border: 0px;">
</body>
</html>