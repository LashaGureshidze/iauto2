<%@page import="ge.iauto.server.model.CarModel"%>
<%@page import="ge.iauto.server.model.CarMake"%>
<%@page import="java.util.HashMap"%>
<%@page import="ge.iauto.server.model.Location"%>
<%@page import="java.util.Iterator"%>
<%@page import="ge.iauto.server.model.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>www.IAuto.ge</title>
<style type="text/css">
#axali_dzebna {
	width: 814px;
	background: rgb(240, 240, 240);
	border: 5px solid rgb(255, 255, 255);
	box-shadow: 4px 4px 21px -4px #858585;
	text-shadow: rgba(180, 78, 78, 0.22) 0.1em 0.1em 0.2em;
	font-weight: normal;
	margin: auto;
}

#gamochenili {
	height: 110px;
}

.sigane {
	display: inline-block;
	width: 200px;
	text-align: center;
}

.fasi_weli_garbeni {
	width: 71px;
	height: 22px;
}

.seleqtebi {
	width: 150px;
	height: 28px;
	margin-top: 3px;
	text-shadow: rgba(78, 78, 78, 0.12) 0.1em 0.1em 0.2em;
}

.dzebna {
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

.dzebna:hover {
	background-color: #3399FF;
	color: white;
}
</style>

<script type="text/javascript">
	function BoxChange(selectObj) {
		var idx = selectObj.selectedIndex;
		var which = selectObj.options[idx].text;
		var cSelect = document.getElementById("model");
		while (cSelect.options.length > 0) cSelect.remove(0);
		var newOption;
		if (which == "მწარმოებელი" || which == "ყველა") {
			newOption = document.createElement("option");
			newOption.value = "0";
			newOption.text = "მწარმოებელი";
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
</script>

</head>
<body>
	<form action="SearchServlet" method="get">
		<div id="axali_dzebna">
			<div id="gamochenili">
				<div id="pirveli_rigi">
					<span class="sigane" style="width: 150px;">
					 <select name="carmake_id" class="seleqtebi"
						onChange="BoxChange(this);" tabindex="1">
							<option value="" selected="selected">მწარმოებელი</option>
							<%
							@SuppressWarnings("unchecked")
							HashMap<String,Long> cars = (HashMap<String,Long>)request.getServletContext().getAttribute("idByName");
							for(String ids : cars.keySet()){
							%>
								<option value="<%=cars.get(ids)%>"><%=ids%></option>
							<%}%>
					</select>
					</span> <span class="sigane" style="text-align: right; width: 200px;">
						<a style="margin-left: -16px;">წელი</a> <select name="year_from"
						tabindex="4" class="seleqtebi" style="width: 75px;">
							<option value="">დან</option>
							<%
								for (int k = 1940; k <= 2013; k++) {
							%>
							<option value=<%=k%>><%=k%></option>
							<%
								}
							%>
					</select> <select name="year_to" tabindex="5" class="seleqtebi"
						style="width: 75px;">
							<option value="">მდე</option>
							<%
								for (int k = 1940; k <= 2013; k++) {
							%>
							<option value=<%=k%>><%=k%></option>
							<%
								}
							%>
					</select>
					</span> <span class="sigane" style="text-align: right;">
					 <select name="gearbox" class="seleqtebi">
							<option value="">ტრანსმისია</option>
							<option value="მექანიკური">მექანიკური</option>
							<option value="ავტომატიკა">ავტომატიკა</option>
							<option value="ტიპტრონიკი">ტიპტრონიკი</option>
					</select>
					</span> <span class="sigane" style="text-align: right;"> <span>განბაჟებული
							<select onChange="" name="ganbajebuli" id="customs_passed"
							class="seleqtebi" style="width: 47px;">
								<option value=""></option>
								<option value="1">კი</option>
								<option value="0">არა</option>
						</select>
					</span>
					</span>
				</div>
				<div id="meore_rigi">
					<span class="sigane" style="width: 150px;"> 
					<select	name="carmodel_id" id="model" class="seleqtebi">
							<option value="" selected="selected">მოდელი</option>
					</select>
					</span> <span class="sigane" style="text-align: right; width: 200px;">
						<a style="">ფასი</a> 
						<input type="text" name="price_from" tabindex="6" value="დან" style="height: 22px; width: 69px;" />
						<input type="text" name="price_to" tabindex="7" value="მდე"
						style="height: 22px; width: 69px;">
					</span> <span class="sigane" style="text-align: right;">
					 <select name="fuel" class="seleqtebi">
							<option value="">საწვავის ტიპი</option>
							<option value="ელექტრო">ელექტრო</option>
							<option value="ბენზინი">ბენზინი</option>
							<option value="დიზელი">დიზელი</option>
							<option value="ტურბოდიზელი">ტურბოდიზელი</option>
							<option value="დიზელი/ტურბოდიზელი">დიზელი/ტურბოდიზელი</option>
							<option value="გაზი/ბენზინი">გაზი/ბენზინი</option>
							<option value="ჰიბრიდი">ჰიბრიდი</option>
					</select>

					</span> <span class="sigane" style="text-align: right;"> <span>მარჯვენა
							საჭე <select name="rightsteeringwheel" class="seleqtebi" style="width: 47px;">
								<option value=""></option>
								<option value="1">კი</option>
								<option value="0">არა</option>
						</select>
					</span>
					</span>
				</div>
				<div id="mesame_rigi">
					<span class="sigane" style="width: 150px;">
					 <select name="category_id" class="seleqtebi">
							<option value="" selected="selected">კატეგორია</option>
							<%
							@SuppressWarnings("unchecked")
							List<Category> categeory = (List<Category>) request
									.getServletContext().getAttribute("categories");
							Iterator<Category> it = categeory.iterator();
							while (it.hasNext()) {
								Category tmp = it.next();
							%>
							<option value=<%=tmp.getId()%>><%=tmp.getName()%></option>
							<%
								}
							%>
					</select>
					</span> <span class="sigane">
					<select	name="location_id" class="seleqtebi">
							<option value="">მდებარეობა</option>
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
					</select>
					</span> <span class="sigane"> <select class="seleqtebi"
						name="last_days">
							<option value="all">განცხადებები</option>
							<option value="1">ბოლო 1 საათი</option>
							<option value="2">ბოლო 2 საათი</option>
							<option value="3">ბოლო 3 საათი</option>

							<option value="4">ბოლო 1 დღე</option>
							<option value="5">ბოლო 2 დღე</option>
							<option value="6">ბოლო 3 დღე</option>

							<option value="7">ბოლო 1 კვირა</option>
							<option value="14">ბოლო 2 კვირა</option>
							<option value="21">ბოლო 3 კვირა</option>

							<option value="31">ბოლო 1 თვე</option>
					</select>
					</span> <span class="sigane">
						<button class="dzebna">ძებნა</button>
					</span>
				</div>
			</div>
		</div>
	</form>
	<table>
		<%
			//karoche aq minda vip gancxadebebis chamateba 
			//bazis saxeli ar vici saidan unda wavikitxo tore shevcham am nawils :D
		%>
	</table>
</body>
</html>