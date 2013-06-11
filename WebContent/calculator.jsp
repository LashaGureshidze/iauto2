<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>www.IAuto.ge - განბაჟების კალკულატორი</title>
<script type="text/javascript">
	function count() {
		var year = document.getElementById("prodyear").value;
		var motor = document.getElementById("enginevolume").value;
		var aqcis;
		switch (2013 - year) {
		case 0, 1:
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
		case 7, 8, 9, 10, 11, 12:
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

		var importi = (motor / 100 * 0.05) + (year * (motor / 100) * 0.0025);

		var sum = aqcis + importi + 72 + 31 + 150;
		document.getElementById("lab_excise").innerHTML = ""
				+ parseInt("" + aqcis);
		document.getElementById("lab_import_payment").innerHTML = ""
				+ parseInt("" + importi);
		document.getElementById("lab_total").innerHTML = ""
				+ parseInt("" + sum);
		document.getElementById("lab_total_dollar").innerHTML = ""; // aq misaweria convertori lari ro gadaiyvanos dolarshi 
	}
</script>

<script type="text/javascript">
	function showSpoiler(obj) {
		var inner = obj.parentNode.getElementsByTagName("div")[0];
		if (inner.style.display == "none")
			inner.style.display = "";
		else
			inner.style.display = "none";
	}
</script>

<style>
#show {
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

#show.cover {
	background-color: #3399FF;
	color: black;
}
</style>

</head>
<body bgcolor=#C8C8C8>
	<%@include file="menu-bar.jsp"%>
	
	<table cellpadding=0 cellspacing=0 border=0 width=100% align=center>
		<tr>
			<td align=center width=100%>
				<table width="80%" border="0">
					<tr>
						<td align="right" width="25%">გამოშვების წელი:</td>
						<td align="left" width="25%"><select id="prodyear"
							onchange="count()">
								<option value='1993'>1993</option>
								<option value='1994'>1994</option>
								<option value='1995'>1995</option>
								<option value='1996'>1996</option>
								<option value='1997'>1997</option>
								<option value='1998'>1998</option>
								<option value='1999'>1999</option>
								<option selected="selected" value='2000'>2000</option>
								<option value='2001'>2001</option>
								<option value='2002'>2002</option>
								<option value='2003'>2003</option>
								<option value='2004'>2004</option>
								<option value='2005'>2005</option>
								<option value='2006'>2006</option>
								<option value='2007'>2007</option>
								<option value='2008'>2008</option>
								<option value='2009'>2009</option>
								<option value='2010'>2010</option>
								<option value='2011'>2011</option>
								<option value='2012'>2012</option>
								<option value='2013'>2013</option>
						</select> <input type="hidden" id="curyear" value="2013" /> <input
							type="hidden" id="dollarrate" value="1.6390" /></td>
					</tr>
					<tr>
						<td align="right" width="25%">ძრავის მოცულობა:</td>
						<td align="left" width="25%"><select id="enginevolume"
							onchange="count()">
								<option selected="selected" value=''></option>
								<%
									for (int k = 1; k <= 60; k++) {
										double motor = k / (double) 10;
										int value = k * 100;
								%>
								<option value=<%=value%>><%=motor%></option>
								<%
									}
								%>
						</select></td>
				</table>
			</td>

		</tr>
		<tr>
			<td align=center width=100%><br /> <br />
				<table width="80%" border="0">
					<tr>
						<td align="right" width="25%">აქციზი:</td>
						<td align="left" width="25%"><label id="lab_excise">
								0</label> ლარი</td>
					</tr>
					<tr>
						<td align="right" width="25%">საბაჟო მომსახურების გადასახადი:
						</td>
						<td align="left" width="25%"><label id="lab_custom_payment">150</label>
							ლარი</td>
					</tr>
					<tr>
						<td align="right" width="25%">იმპორტის გადასახადი:</td>
						<td align="left" width="25%"><label id="lab_import_payment">0</label>
							ლარი</td>
					</tr>

					<tr>
						<td align="right" width="25%">ნომერი, ტექ. პასპორტი და ტექ.
							დათვალიერება:</td>
						<td align="left" width="25%">72 ლარი</td>
					</tr>
					<tr>
						<td align="right" width="25%">საბაჟო დეკლარაცია:</td>
						<td align="left" width="25%">31 ლარი</td>
					</tr>
					<tr>
						<td align="right" width="25%">&nbsp;</td>
						<td align="left" width="25%">&nbsp;</td>
					</tr>
					<tr valign=top>
						<td align="right" width="25%">სულ:<br />ეროვნული ბანკის
							კურსით
						</td>
						<td align="left" width="25%"><font color="#FF0000"><b><label
									id="lab_total">0</label> ლარი</b></font> = <font color="#FF0000"><b><label
									id="lab_total_dollar">0</label>$</b></font> <br />1 USD = 1.6390 GEL</td>

					</tr>
				</table></td>

		</tr>
	</table>

	<div class="spoiler" align="center">
		<input id="show" type="button" onclick="showSpoiler(this);"
			value="დაწვრილებით" />
		<div class="inner" style="display: none;">
			<form>
				<fieldset style="text-align: left;">
					<table width=80% border="0">
						<tr>
							<td>
								<center>
									<cite>შიდა ტრანზიტის ღირებულება 1 დღე - 1 ლარი.</cite>
								</center> <br /> <cite>მოტოციკლების და სპეცტექნიკის განბაჟების
									დროს განბაჟების ღირებულება შეადგენს სატრანსპორტო საშუალების
									ღირებულების 18% -ს + საბაჟო მომსახურების გადასახადი 300 ლარი <br />
									მოტოციკლის ტექნიკუტი დათვალიერების და ტექნიკური პასპორტის
									აღების საფასური შეადგენს 62 ლარს
							</cite><br />
								<p>
									<cite>საქართველოს საგადასახადო კოდექსის 188 მუხლის
										მიხედვით მსუბუქი ავტომობილის განბაჟების ტარიფის სააქციზო
										განაკვეთი დამოკიდებულია ავტომობილის ასაკზე(დასაბეგრი ოპერაციის
										განხორციელების წელსა და მსუბუქი ავტომობილის გამოშვების წელს
										შორის სხვაობა). აქციზის გადასახადს ვიღებთ სააქციზო განაკვეთის
										გამრავლებით მისი ძრავის მოცულობაზე.</cite>
								</p> <cite> <br> 1 წლამდე 1.5 <br>1 წლის 1.5 <br>
									2 წლის 1.4<br> 3 წლის 1.3<br> 4 წლის 1.2<br> 5
									წლის 1.0<br> 6 წლის 0.7<br> 7 წლის 0.5<br> 8
									წლის 0.5<br> 9 წლის 0.5<br> 10 წლის 0.5<br> 11
									წლის 0.5<br> 12 წლის 0.5<br> 13 წლის 0.6<br> 14
									წლის 0.7<br> 14 წელზე მეტის 0.8 <br>
							</cite>
								<p>
									<cite>მიღებულ თანხას ემატება საბაჟო
										მომსახურებისგადასახადი რომელიც შეადგენს ფიქსირებულად 150 ლარს
										და იმპორტის გადასახადი(მომსახურების გადსახადში შედის ასევე
										დეკლარაციის შევსება, ამ მომსახურებაში დამატებით გადასახადს არ
										იხდით). იმპორტის გადასახადის გამოსათვლელად ავტომობილის ძრავის
										კუბატურას ვამრავლებთ 0.05-ზე და მიღებულ რიცხვს ვუმატებთ
										ავტომობილის ასაკის, ძრავის კუბატურის და 0.0025-ის ნამრავლს.
										ანუ იმპორტის
										გადასახადი=(კუბატურა*0.05)+(კუბატურა*ასაკი*0.0025).</cite>
								</p>

								<p>
									<cite>ამ თანხას ემატება ავტომობილის ტექნიკური პასპორტის,
										ტექნიკური დათვალიერების და ნომრის აღების საფასური, რომელიც
										ფიქსირებულად შეადგენს 72 ლარს.</cite>
								</p>
							</td>
						</tr>
					</table>
				</fieldset>
			</form>
		</div>
	</div>
</body>
</html>


