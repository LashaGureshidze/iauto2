<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=UTF-8"%>
<%@page import="ge.iauto.server.model.Location"%>
<%@page import="java.util.Iterator"%>
<%@page import="ge.iauto.server.model.Category"%>
<%@page import="java.util.List"%>
<%@page import="ge.iauto.server.model.CarModel"%>
<%@page import="ge.iauto.server.model.CarMake"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	if (request.getSession().getAttribute("user") == null)
		request.getRequestDispatcher("log-in.jsp").forward(request, response);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>www.IAuto.ge - დამატება</title>

<%@include file="menu-bar.jsp"%>

<style>
#adding {
	background: #66CCFF;
	padding: 3px 17px;
	color: black;
	font-family: 'Helvetica Neue', sans-serif;
	font-size: 15px;
	border-radius: 2px;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border: 0px solid rgb(213, 150, 17);
	cursor: pointer;
}

#adding.cover {
	background-color: #3399FF;
	color: black;
}
</style>
<script type="text/javascript">
	function BoxChange(selectObj) {
		var idx = selectObj.selectedIndex;
		var which = selectObj.options[idx].text;
		var cSelect = document.getElementById("model_id");
		while (cSelect.options.length > 0) {
			cSelect.remove(0);
		}
		if(which == ""){
			var newOption;
			newOption = document.createElement("option");
			newOption.value = "";
			newOption.text = "ყველა";
			try {
				cSelect.add(newOption); 
			} catch (e) {
				cSelect.appendChild(newOption);
			}
			checkStarFields();
			return;
		}
		var newOption;
		<%
		@SuppressWarnings("unchecked")
		HashMap<String,Long> car = (HashMap<String,Long>)request.getServletContext().getAttribute("idByName");
		@SuppressWarnings("unchecked")
		HashMap<Long,CarMake> models = (HashMap<Long,CarMake>)request.getServletContext().getAttribute("carById");
		for(String name : car.keySet()){	
		%>
			if(which == "<%=name%>"){
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
			checkStarFields();
	}
</script>

<script type="text/javascript">
function checkStarFields() {
	var category = document.getElementById('category_id').options[document.getElementById('category_id').selectedIndex].value;
	var make = document.getElementById('carmake_id').options[document.getElementById('carmake_id').selectedIndex].value;
	var model = document.getElementById('model_id').options[document.getElementById('model_id').selectedIndex].value;
	var location = document.getElementById('location_id').options[document.getElementById('location_id').selectedIndex].value;
	var year = document.getElementById('prod_year').options[document.getElementById('prod_year').selectedIndex].value;
	var month = document.getElementById('prod_month').options[document.getElementById('prod_month').selectedIndex].value;
	var price = document.getElementById('price').value;
	var engine = document.getElementById('engine_volume').options[document.getElementById('engine_volume').selectedIndex].value;
	if (category != 0 && make.length != 0 && model.length !=0 && location.length !=0
			&& year.length !=0 && month.length !=0 && price.length !=0 && engine.length !=0) {
		document.getElementById("adding").disabled = false;
	} else document.getElementById("adding").disabled = true;
}

function isNumber(e) {
	var charCode;
    if (window.event) charCode = window.event.keyCode;
    else if (e) {
    	charCode = e.which;
    } else return true;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) return false;
    return true;
}
</script>

<body>
	<form action="AddCar" method="post" enctype="multipart/form-data" acceptcharset="UTF-8">
		<table width=800 cellspacing=3 border=0>
			<tr>
				<td align=right>კატეგორია<font color="red">*</font>:</td>
				<td align=left><select name=category_id onchange="checkStarFields()"
					id=category_id>
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
			</tr>
			<tr>
				<td align=right>მწარმოებელი<font color="red">*</font>:</td>
				<td align=left>
				<select name="carmake_id" id="carmake_id" onChange="BoxChange(this);" tabindex="1">
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
				<td align="left"><input name="price" id="price" size="6"
					maxlength="8" onkeypress="return isNumber(event)" onchange="checkStarFields()" /> <select
					name="currency_id" id="currency_id">
						<option value="$">$</option>
						<option value="ევრო">ევრო</option>
						<option value="ლარი">ლარი</option>
				</select><br /> <input type="checkbox" name="customs_passed" /> განბაჟებული</td>
			</tr>
			<tr>
				<td align="right">მოდელი<font color="red">*</font>:</td>
				<td align="left">
					<select name="model_id" id="model_id" class="seleqtebi" onchange="checkStarFields()">
							<option value="" selected="selected"></option>
					</select> 
				</td>
				<td align="right">გაცვლა:</td>
				<td align="left"><input type="checkbox" name="changable" /></td>
			</tr>

			<tr>
			<tr>
				<td align="right">მდებარეობა<font color="red">*</font>:</td>
				<td align="left"><select name="location_id" id="location_id" onchange="checkStarFields()">
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
				<td align=right>ამჟამად იყიდება აუქციონზე:</td>
				<td align=left><input type="checkbox" name="is_auction"
					id="is_auction" onClick="auctionOnClick()"></td>
			</tr>

			<tr>
				<td align=right>გამოშვების წელი<font color="red">*</font>:</td>
				<td align=left><select name='prod_year' id='prod_year' onchange="checkStarFields()">
						<option></option>
						<%
							for (int k = 1960; k <= 2013; k++) {
						%>
						<option value=<%=k%>><%=k%></option>
						<%
							}
						%>
				</select> თვე<font color="red">*</font>: <select name="prod_month" id="prod_month" onchange="checkStarFields()"><option value=""></option>
						<%
							for (int k = 1; k <= 12; k++) {
						%>
						<option value=<%=k%>><%=k%></option>
						<%
							}
						%>
				</select></td>
				<td align=right>ძრავის მოცულობა<font color="red">*</font>:</td>
				<td align=left><select name="engine_volume" id="engine_volume" onchange="checkStarFields()">
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
				<td align=right>გარბენი</td>
				<td align=left><input name="car_run" size="7" maxlength="7"
					onkeypress="return isNumber(event)"> <select
					name="car_run_dim" id="car_run_dim"><option value="კმ">კმ.</option>
						<option value="მილი">მილი</option>
				</select></td>
				<td align=right>ცილინდრები:</td>
				<td align=left><select name=cylinders>
						<%
							for (int k = 1; k <= 12; k++) {
						%>
						<option value=<%=k%>><%=k%></option>
						<%
							}
						%>
				</select></td>
			</tr>
			<tr>
				<td align=right>კარები:</td>
				<td align=left><select name=door_type_id>
						<option value=4/5>4/5</option>
						<option value=2/3>2/3</option>
						<option value=1>1</option>
						<option value=5>5</option>
						<option value=0>0</option>
				</select></td>
				<td align=right>წამყვანი თვლები:</td>
				<td align=left><select name=drive_type_id>
						<option value=წინა>წინა</option>
						<option value=უკანა>უკანა</option>
						<option value=4x4>4x4</option>
				</select></td>

			</tr>
			<tr>
				<td align=right>აირბეგი:</td>
				<td align=left><select name=airbags>
						<%
							for (int k = 1; k <= 12; k++) {
						%>
						<option value=<%=k%>><%=k%></option>
						<%
							}
						%>
				</select></td>
				<td align=right>საწვავის ტიპი:</td>
				<td align=left><select name=fuel_type_id>
						<option value=ბენზინი>ბენზინი</option>
						<option value=ბენზინი/კარბურატორი>ბენზინი/კარბურატორი</option>
						<option value=დიზელი>დიზელი</option>
						<option value=ტურბოდიზელი>ტურბოდიზელი</option>
						<option value=გაზი/ბენზინი>გაზი/ბენზინი</option>
						<option value=ჰიბრიდი>ჰიბრიდი</option>
						<option value=ელექტრო>ელექტრო</option>
				</select></td>
			</tr>

			<tr>
				<td align=right>ფერი:</td>
				<td align=left><select name=color_id>
						<option value=შავი>შავი</option>
						<option value=თეთრი>თეთრი</option>
						<option value=ბეჟი>ბეჟი</option>
						<option value=ცისფერი>ცისფერი</option>
						<option value=ყვითელი>ყვითელი</option>
						<option value=მწვანე>მწვანე</option>
						<option value=ოქროსფერი>ოქროსფერი</option>
						<option value=ყავისფერი>ყავისფერი</option>
						<option value=წითელი>წითელი</option>
						<option value=სტაფილოსფერი>სტაფილოსფერი</option>
						<option value=შინდისფერი>შინდისფერი</option>
						<option value=ვერცხლისფერი>ვერცხლისფერი</option>
						<option value=ნაცრისფერი>ნაცრისფერი</option>
						<option value=ლურჯი>ლურჯი</option>
						<option value=ბადრიჯნისფერი>ბადრიჯნისფერი</option>
				</select></td>
			</tr>
			<tr>
				<td align=right>გადაცემათა კოლოფი:</td>
				<td align=left><select name="gear_type_id">
						<option value=მექანიკა>მექანიკა</option>
						<option value=ავტომატიკა>ავტომატიკა</option>
						<option value=ტიპტრონიკი>ტიპტრონიკი</option>
				</select></td>

				<td align=right>მარჯვენა საჭე:</td>
				<td align="left"><input type="checkbox" name="right_wheel" /></td>
			</tr>
			<tr>
				<td align=right></td>
				<td align=left></td>
				<td align=right>ტურბო:</td>
				<td align="left"><input type="checkbox" name="has_turbo">
				</td>
			</tr>
			<tr>
				<td align="right">თქვენი სახელი:</td>
				<td align="left"><input name="client_nm" size="10"
					maxlength="30"></td>
				<td align="right">თქვენი ტელეფონი:</td>
				<td align="left" width="220px"><label id="lab_client_phone">
				</label> <input name="client_phone_1" id="client_phone_1" value="" size="6"
					maxlength="9" onKeyPress="return keyfilter_num(event)"> <!-- <br/><input type="checkbox" checked="checked" id="is_georgia" onclick="georgiaOnClick()" name="is_georgia" />საქართველო -->
				</td>
			</tr>

			<tr>
				<td align=right>ABS:</td>
				<td align=left><input type=checkbox name=abs></td>
				<td align=right>პარკინგკონტროლი:</td>
				<td align=left><input type=checkbox name=obstacle_indicator>
				</td>

			</tr>
			<tr>
				<td align=right>ელ. შუშები:</td>
				<td align=left><input type=checkbox name=el_windows></td>
				<td align=right>კონდინციონერი:</td>
				<td align=left><input type=checkbox name=condintioner></td>
			</tr>
			<tr>
				<td align=right>კლიმატკონტროლი:</td>
				<td align=left><input type=checkbox name=climat_control>
				</td>
				<td align=right>ტყავის სალონი:</td>
				<td align=left><input type=checkbox name=leather></td>
			</tr>
			<tr>
				<td align=right>დისკები:</td>
				<td align=left><input type=checkbox name=disks></td>
				<td align=right>ნავიგაცია:</td>
				<td align=left><input type=checkbox name=nav_system></td>
			</tr>
			<tr>
				<td align=right>ლუქი:</td>
				<td align=left><input type=checkbox name=hatch></td>
				<td align=right>ცენტრალური საკეტი:</td>
				<td align=left><input type=checkbox name=central_lock></td>
			</tr>
			<tr>
				<td align=right>ბორტკომპიუტერი:</td>
				<td align=left><input type=checkbox name=board_comp></td>
				<td align=right>სავარძლების გათბობა:</td>
				<td align=left><input type=checkbox name=chair_warming></td>
			</tr>
			<tr>
				<td align=right>სიგნალიზაცია:</td>
				<td align=left><input type=checkbox name=alarm></td>
				<td align=right>ჰიდრავლიკა:</td>
				<td align=left><input type=checkbox name=hydraulics></td>
			</tr>
			<tr>
				<td align = right ><b>VIN კოდი</b>:
				</td>
				<td align =left ><input type=text name="vin"  id="vin" >
				</td>

			</tr>
		</table>

		<div align="center">
			მოკლე აღწერა<br> <br>
			<textarea cols="60" rows="5" name="discription">
				 </textarea>
			<br> <br>
		</div>

		<table cellspacing=10 border=0>
			<tr>
				<td align=right width=250>I სურათი (640x480) :</td>
				<td align=left><input type="FILE" name="photo1" size=80 >
				</td>
			</tr>
			<tr>
				<td align=right width=250>II სურათი (640x480) :</td>
				<td align=left><input type="FILE" name="photo2" size=80>
				</td>
			</tr>

			<tr>
				<td align=right width=250>III სურათი (640x480) :</td>
				<td align=left><input type="FILE" name="photo3" size=80>
				</td>
			</tr>

			<tr>
				<td align=right width=250>IV სურათი (640x480) :</td>
				<td align=left><input type="FILE" name="photo4" size=80>
				</td>
			</tr>

			<tr>
				<td align=right width=250>V სურათი (640x480) :</td>
				<td align=left><input type="FILE" name="photo5" size=80>
				</td>
			</tr>

			<tr>
				<td align=right width=250>VI სურათი (640x480) :</td>
				<td align=left><input type="FILE" name="photo6" size=80>
				</td>
			</tr>
			
			<tr>
				<td align="center"><br> <input id="adding" type="submit"
					value="დამატება" disabled="disabled"/></td>
			</tr>

		</table>
	</form>
</body>
</html>

