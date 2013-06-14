<%@page import="ge.iauto.server.model.Car"%>
<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=UTF-8"%>
<%@page import="ge.iauto.server.model.Location"%>
<%@page import="java.util.Iterator"%>
<%@page import="ge.iauto.server.model.Category"%>
<%@page import="java.util.List"%>
<%@page import="ge.iauto.server.model.CarModel"%>
<%@page import="ge.iauto.server.model.CarMake"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="images.jpg" rel="shortcut icon" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>მანქანის შეცვლა</title>
</head>
<body background="bg.png">
	<%
	Car update = (Car)request.getAttribute("carToUpdate");
	Car update1 = (Car)request.getAttribute("carToUpdate");
	request.getSession().setAttribute("car", update1);
	%>
	<%@include file="menu-bar.jsp"%>
	<fieldset class="fieldSet">
		<form action=UpdateCar method="post">
			<table width="800px" cellspacing="3px" border="0px">
				<tr>
					<td align=right>კატეგორია<font color="red">*</font>:</td>
					<td align=left><select class="box" name=category_id onchange="checkStarFields()" id="category_id">
						<option value="">აირჩიეთ კატეგორია</option>
						<%
							@SuppressWarnings("unchecked")
							List<Category> categeory = (List<Category>) request.getServletContext().getAttribute("categories");
							Iterator<Category> it = categeory.iterator();
							while (it.hasNext()) {
								Category tmp = it.next();
						%>
						<option value=<%=tmp.getId()%>><%=tmp.getName()%></option>
						<%
							}
						%>
					</select> 
					<td align=right>კარები:</td>
					<td align=left><select class="box" name=door_type_id id="door_type_id">
							<option value=4/5>4/5</option>
							<option value=2/3>2/3</option>
							<option value=1>1</option>
							<option value=5>5</option>
							<option value=0>0</option>
					</select>
					</td>
				</tr>
				<tr>
					<td align=right>მწარმოებელი<font color="red">*</font>:</td>
					<td align=left>
					<select class="box" name="carmake_id" id="carmake_id" onChange="BoxChange(this);" tabindex="1">
							<option value="" selected="selected"></option>
								<%
								@SuppressWarnings("unchecked")
								HashMap<String,Long> cars = (HashMap<String,Long>)request.getServletContext().getAttribute("idByName");
								for(String ids : cars.keySet()){
								%>
									<option value="<%=cars.get(ids)%>" ><%=ids%></option>
								<%}%>
					</select></td>
					<td align="right">ფასი<font color="red">*</font>:</td>
					<td align="left"><input type="text" name="price" id="price" size="6"
						maxlength="8" onkeypress="return isNumber(event)" onchange="checkStarFields()" /> <select class="box"
						name="currency_id" id="currency_id">
							<option value="$">$</option>
							<option value="ევრო">ევრო</option>
							<option value="ლარი">ლარი</option>
					</select><br /> <input type="checkbox" name="customs_passed" id="ganbajebuli"/> განბაჟებული</td>
				</tr>
				<tr>
					<td align="right">მოდელი<font color="red">*</font>:</td>
					<td align="left">
						<select class="box" name="model_id" id="model_id" class="seleqtebi" onchange="checkStarFields()">
								<option value="" selected="selected"></option>
						</select> 
					</td>
					<td align=right>ძრავის მოცულობა<font color="red">*</font>:</td>
					<td align=left><select class="box" name="engine_volume" id="engine_volume" onchange="checkStarFields()">
							<option selected="selected" value=''></option>
							<%
								for (int k = 1; k <= 80; k++) {
									double motor = k / (double) 10;
							%>
							<option value=<%=motor%>><%=motor%></option>
							<%
								}
							%>
					</select></td>
				</tr>
				<tr>
				<tr>
					<td align="right">მდებარეობა<font color="red">*</font>:</td>
					<td align="left"><select class="box" name="location_id" id="location_id" onchange="checkStarFields()">
							<option value="" selected="selected"></option>
							<%
								@SuppressWarnings("unchecked")
								List<Location> locat = (List<Location>) request.getServletContext()
										.getAttribute("locations");
								Iterator<Location> it1 = locat.iterator();
								while (it1.hasNext()) {
									Location tmp = it1.next();
							%>
							<option value=<%=tmp.getId()%>><%=tmp.getName()%></option>
							<%
								}
							%>
					</select></td>
					<td align=right>ცილინდრები:</td>
					<td align=left><select class="box" name=cylinders id="cylinders">
							<%
								for (int k = 1; k <= 12; k++) {
							%>
							<option value=<%=k%>><%=k%></option>
							<%
								}
							%>
					</select>
					</td>
				</tr>
				<tr>
					<td align="right">თქვენი სახელი:</td>
					<td align="left"><input type="text" name="client_nm" size="10"
						maxlength="30" id="name"></td>
					<td align="right">თქვენი ტელეფონი:</td>
					<td align="left" width="220px"><label id="lab_client_phone">
					</label> <input class="field" name="client_phone_1" id="phone_number" value="" size="6"
						maxlength="9" onKeyPress="return keyfilter_num(event)"> <!-- <br/><input type="checkbox" checked="checked" id="is_georgia" onclick="georgiaOnClick()" name="is_georgia" />საქართველო -->
					</td>
				</tr>
				<tr>
					<td align=right>დისკები:</td>
					<td align=left><input type=checkbox name=disks id="disks"></td>
					<td align=right>ნავიგაცია:</td>
					<td align=left><input type=checkbox name=nav_system id="nav_system"></td>
				</tr>
				<tr>
					<td align=right>ლუქი:</td>
					<td align=left><input type=checkbox name=hatch id="hatch"></td>
					<td align=right>ცენტრალური საკეტი:</td>
					<td align=left><input type=checkbox name=central_lock id="central_lock"></td>
				</tr>
				<tr>
					<td align=right>ბორტკომპიუტერი:</td>
					<td align=left><input type=checkbox name=board_comp id="board_comp"></td>
					<td align=right>სავარძლების გათბობა:</td>
					<td align=left><input type=checkbox name=chair_warming id="chair_warming"></td>
				</tr>
				<tr>
					<td align=right>სიგნალიზაცია:</td>
					<td align=left><input type=checkbox name=alarm id="alarm"></td>
					<td align=right>ჰიდრავლიკა:</td>
					<td align=left><input type=checkbox name=hydraulics id="hydraulics"></td>
				</tr>
			</table>
	
			<div align="center">
				მოკლე აღწერა<br> <br>
				<textarea cols="60" rows="5" name="discription" id="discription">
					 </textarea>
				<br><br>
			</div>
	
			<table cellspacing=10 border=0>
				<tr>
					<td align="center" id="addingParent"><br> <input id="adding" type="submit" name="add"
						value="დამატება" /></td>
				</tr>
			</table>
		</form>
		</fieldset>
		<script type="text/javascript">
			function BoxChange(selectObj) {
				var idx = selectObj.selectedIndex;
				var which = selectObj.options[idx].text;
				var cSelect = document.getElementById("model_id");
				while (cSelect.options.length > 0) cSelect.remove(0);
				var newOption;
				if (which == "მწარმოებელი" || which == "ყველა") {
					newOption = document.createElement("option");
					newOption.value = "";
					newOption.text = "მოდელი";
					try {
						cSelect.add(newOption); 
					} catch (e) {
						cSelect.appendChild(newOption);
					}	
					return;
				}
				<%
				@SuppressWarnings("unchecked")
				HashMap<String,Long> car = (HashMap<String,Long>)request.getServletContext().getAttribute("idByName");
				@SuppressWarnings("unchecked")
				HashMap<Long,CarMake> models = (HashMap<Long,CarMake>)request.getServletContext().getAttribute("carById");
				for(String name : car.keySet()){	
				%>
					if(which == "<%=name%>"){
						newOption = document.createElement("option");
						newOption.value = "";
						newOption.text = "მოდელი";
						try {
							cSelect.add(newOption); 
						} catch (e) {
							cSelect.appendChild(newOption);
						}	
					<%
						for(CarModel model : models.get(car.get(name)).getModels()){
					%>
							newOption = document.createElement("option");
							newOption.value = "<%=model.getId()%>";
							newOption.text = "<%=model.getName()%>";
							try {
								cSelect.add(newOption); 
							} catch (e) {
								cSelect.appendChild(newOption);
							}
					<%
						}
					%>		
					}
				<%
				}
				%>
			}
			function myfunc(elmnt,value){
				for(var i=0; i < elmnt.options.length; i++)
				{
				  if(elmnt.options[i].value == value)
				    elmnt.selectedIndex = i;
				}
			}
			myfunc(document.getElementById("category_id"),"<%=update.getCategory().getId()%>");
			myfunc(document.getElementById("carmake_id"),"<%=update.getCarmake().getId()%>");
			BoxChange(document.getElementById("carmake_id"));
			myfunc(document.getElementById("model_id"),"<%=update.getCarmodel().getId()%>");
			myfunc(document.getElementById("location_id"),"<%=update.getLocation().getId()%>");
			myfunc(document.getElementById("engine_volume"),"<%=update.getEngine()%>");
			myfunc(document.getElementById("cylinders"),"<%=update.getCylinder()%>");
			myfunc(document.getElementById("door_type_id"),"<%=update.getDoors()%>");
			document.getElementById("price").value ="<%=update.getPrice()%>";
			myfunc(document.getElementById("currency_id"),"<%=update.getCurrency()%>");
			<%if(update.isGanbajebuli()){%>document.getElementById("ganbajebuli").checked = true;<%}%>
			document.getElementById("name").value = "<%=update.getUsername()%>";
			document.getElementById("phone_number").value = "<%=update.getTelephone()%>";
			<%if(update.isWheel()){%>document.getElementById("disks").checked = true;<%}%>
			<%if(update.isTopwindow()){%>document.getElementById("hatch").checked = true;<%}%>
			<%if(update.isNavigation()){%>document.getElementById("nav_system").checked = true;<%}%>
			<%if(update.isCentrallock()){%>document.getElementById("central_lock").checked = true;<%}%>
			<%if(update.isComputer()){%>document.getElementById("board_comp").checked = true;<%}%>
			<%if(update.isCentrallock()){%>document.getElementById("central_lock").checked = true;<%}%>
			<%if(update.isSavardzlisgatboba()){%>document.getElementById("chair_warming").checked = true;<%}%>
			<%if(update.isSequrity()){%>document.getElementById("alarm").checked = true;<%}%>
			<%if(update.isHydraulics()){%>document.getElementById("hydraulics").checked = true;<%}%>
			document.getElementById("discription").value = "<%=update.getDescribtion()%>";
		</script>
	</body>
</html>