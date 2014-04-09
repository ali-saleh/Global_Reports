<%@page import="java.util.Date"%>
<%@page import="bl.JBillingSrvImp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="beans.GCConstants"%>
<%@page import="java.util.List"%>
<%@page import="beans.GCUser"%>
<%@page import="utils.GCProperties"%>
<% 
GCProperties prop = GCProperties.getSystemProperties();
List<GCUser> dollarUsers = (List<GCUser>)request.getAttribute(GCConstants.FLD_REPORTS_OUTSTANDING_DOLLAR);
List<GCUser> dollarDeletedUsers = (List<GCUser>)request.getAttribute(GCConstants.FLD_REPORTS_OUTSTANDING_DOLLAR_DELETED);
List<GCUser> shekelUsers = (List<GCUser>)request.getAttribute(GCConstants.FLD_REPORTS_OUTSTANDING_SHEKEL);
List<GCUser> shekelDeletedUsers = (List<GCUser>)request.getAttribute(GCConstants.FLD_REPORTS_OUTSTANDING_SHEKEL_DELETED);

boolean dollarAvaliableCities[] = new boolean[9];
boolean shekelAvaliableCities[] = new boolean[9];
for(int i=0; i<9; i++){
	dollarAvaliableCities[i] = false;
}

if(dollarUsers!=null){
	for(GCUser user:dollarUsers){
		dollarAvaliableCities[user.getCity()] = true;
	}
}

for(int i=0; i<9; i++){
	shekelAvaliableCities[i] = false;
}
if(shekelUsers!=null){
	for(GCUser user:shekelUsers){
		shekelAvaliableCities[user.getCity()] = true;
	}	
}

boolean dollarDeletedAvaliableCities[] = new boolean[9];
boolean shekelDeletedAvaliableCities[] = new boolean[9];
for(int i=1; i<9; i++){
	dollarDeletedAvaliableCities[i] = false;
}

if(dollarDeletedUsers!=null){
	for(GCUser user:dollarDeletedUsers){
		dollarDeletedAvaliableCities[user.getCity()] = true;
	}	
}

for(int i=1; i<9; i++){
	shekelDeletedAvaliableCities[i] = false;
}

if(shekelDeletedUsers != null){
	for(GCUser user:shekelDeletedUsers){
		shekelDeletedAvaliableCities[user.getCity()] = true;
	}	
}

BigDecimal customerBalance = BigDecimal.ZERO;
int currency =0;
int number=1;

String cityIDString = (String)request.getAttribute(GCConstants.FLD_USR_CITY);
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
		<link rel="stylesheet" type="text/css" href="./client/css/reports.css" />
		<title>
		
		</title>
	</head>
	<body>
		<div class="report_results_page balance_results_report">
		<div class="report_main_title">
			<%= prop.get(GCConstants.MSG_REPORTS_BALANCE_REPORT_TITLE, null) %>
		</div>
		<div class="report_logo">
			<img alt="logo" src="./client/images/logobw.png">
		</div>
		<div style="clear:both;"></div>
		<div class="seperator"></div>
		<div class="seperator"></div>
		<div class="report_info">
			<div class="report_city">
				<% if(cityIDString.equals("0")){ %>
					<%= prop.get(GCConstants.MSG_REPORTS_ALL_CITIES, null) %>
				<%}else{ %>
					<%= prop.get(GCConstants.MSG_REPORTS_ONE_CITY, null)+" "+prop.get(GCConstants.PROP_CITY_PREFIX+cityIDString, null) %>
				<%} %>
			</div>
			<div class="report_date">
				<div class="report_from_date">
					
				</div>
				<div class="report_to_date">
					<%= prop.get(GCConstants.MSG_REPORTS_TO_DATE, null)+" "+JBillingSrvImp.DF.format(new Date()) %>
				</div>
			<div class="report_payway">
				
			</div>
		</div>
		<div class="seperator"></div>
		<div class="seperator"></div>
		<div style="clear: both;"></div>
		<% for(int i = 1; i<9; i++){ %>
			<% if(dollarAvaliableCities[i]){ %>
				<% if(dollarUsers!=null){ %>
					<% number=1; %>
					<% customerBalance = BigDecimal.ZERO; %>
					<div class="report_title">
						<%= prop.get(GCConstants.MSG_REPORTS_BALANCE_NAME_DOLLAR)+" ("+prop.get(GCConstants.PROP_CITY_PREFIX+i)+")" %>
					</div>
					<div style="clear: both;"></div>
					<table>
						<tr>
							<th style="width: 50px"><%= "#" %></th>
							<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_BALANCE_REPORT_CUSTOMER_NUMBER) %></th>
							<th style="width: 200px"><%= prop.get(GCConstants.MSG_REPORTS_BALANCE_REPORT_CUSTOMER_NAME) %></th>
							<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_BALANCE_REPORT_CITY) %></th>
							<th style="width: 150px"><%= prop.get(GCConstants.MSG_REPORTS_BALANCE_REPORT_BALANCE)+"<br/>"+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"1", null) %></th>
						</tr>
						<% for(GCUser user : dollarUsers){ %>
							<%if(user.getCity()==i){ %>
								<tr>
									<td style="text-align: center;"><%= number++ %></td>
									<td><%= user.getUserNumber() %></td>
									<td><%= user.getFullName() %></td>
									<td><%= prop.get(GCConstants.PROP_CITY_PREFIX+user.getCity(), null) %></td>
									<td><%= user.getBalance() %></td>
								</tr>
								<% customerBalance=customerBalance.add(new BigDecimal(user.getBalance())); %>
								<% currency=user.getCurrencyID(); %>
							<%} %>
						<%} %>
						<tr>
							<td style="border: 0" colspan="3"></td>
							<td style="border: 0; text-align: center;font-weight: bold;"><%=prop.get(GCConstants.MSG_REPORTS_BALANCE_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+currency, null) %></td>
							<td style="font-weight: bold;"><%=customerBalance.toString() %></td>
						</tr>
					</table>
				<%} %>
			<%} %>
		<%} %>
		
		<% for(int i = 1; i<9; i++){ %>
			<% if(shekelAvaliableCities[i]){ %>
				<% if(shekelUsers!=null){ %>
					<% number=1; %>
					<% customerBalance = BigDecimal.ZERO; %>
					<div class="report_title">
						<%= prop.get(GCConstants.MSG_REPORTS_BALANCE_NAME_SHEKEL)+" ("+prop.get(GCConstants.PROP_CITY_PREFIX+i)+")" %>
					</div>
					<div style="clear: both;"></div>
					<table>
						<tr>
							<th style="width: 50px"><%= "#" %></th>
							<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_BALANCE_REPORT_CUSTOMER_NUMBER) %></th>
							<th style="width: 200px"><%= prop.get(GCConstants.MSG_REPORTS_BALANCE_REPORT_CUSTOMER_NAME) %></th>
							<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_BALANCE_REPORT_CITY) %></th>
							<th style="width: 150px"><%= prop.get(GCConstants.MSG_REPORTS_BALANCE_REPORT_BALANCE)+"<br/>"+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"12", null) %></th>
						</tr>
						<% for(GCUser user : shekelUsers){ %>
							<%if(user.getCity()==i){ %>
								<tr>
									<td style="text-align: center;"><%= number++ %></td>
									<td><%= user.getUserNumber() %></td>
									<td><%= user.getFullName() %></td>
									<td><%= prop.get(GCConstants.PROP_CITY_PREFIX+user.getCity(), null) %></td>
									<td><%= user.getBalance() %></td>
								</tr>
								<% customerBalance=customerBalance.add(new BigDecimal(user.getBalance())); %>
								<% currency=user.getCurrencyID(); %>
							<%} %>
						<%} %>
						<tr>
							<td style="border: 0" colspan="3"></td>
							<td style="border: 0; text-align: center;font-weight: bold;"><%=prop.get(GCConstants.MSG_REPORTS_BALANCE_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+currency, null) %></td>
							<td style="font-weight: bold;"><%=customerBalance.toString() %></td>
						</tr>
					</table>
				<%} %>
			<%} %>
		<%} %>
			
			
			
			
			
			<% for(int i = 1; i<9; i++){ %>
			<% if(dollarDeletedAvaliableCities[i]){ %>
				<% if(dollarDeletedUsers!=null){ %>
					<% number=1; %>
					<% customerBalance = BigDecimal.ZERO; %>
					<div class="report_title">
						<%= prop.get(GCConstants.MSG_REPORTS_BALANCE_NAME_DOLLAR)+" ("+prop.get(GCConstants.PROP_CITY_PREFIX+i)+") "+prop.get(GCConstants.MSG_REPORTS_DELETED, null) %>
					</div>
					<div style="clear: both;"></div>
					<table>
						<tr>
							<th style="width: 50px"><%= "#" %></th>
							<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_BALANCE_REPORT_CUSTOMER_NUMBER) %></th>
							<th style="width: 200px"><%= prop.get(GCConstants.MSG_REPORTS_BALANCE_REPORT_CUSTOMER_NAME) %></th>
							<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_BALANCE_REPORT_CITY) %></th>
							<th style="width: 150px"><%= prop.get(GCConstants.MSG_REPORTS_BALANCE_REPORT_BALANCE)+"<br/>"+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"1", null) %></th>
						</tr>
						<% for(GCUser user : dollarDeletedUsers){ %>
							<%if(user.getCity()==i){ %>
								<tr>
									<td style="text-align: center;"><%= number++ %></td>
									<td><%= user.getUserNumber() %></td>
									<td><%= user.getFullName() %></td>
									<td><%= prop.get(GCConstants.PROP_CITY_PREFIX+user.getCity(), null) %></td>
									<td><%= user.getBalance() %></td>
								</tr>
								<% customerBalance=customerBalance.add(new BigDecimal(user.getBalance())); %>
								<% currency=user.getCurrencyID(); %>
							<%} %>
						<%} %>
						<tr>
							<td style="border: 0" colspan="3"></td>
							<td style="border: 0; text-align: center;font-weight: bold;"><%=prop.get(GCConstants.MSG_REPORTS_BALANCE_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+currency, null) %></td>
							<td style="font-weight: bold;"><%=customerBalance.toString() %></td>
						</tr>
					</table>
				<%} %>
			<%} %>
		<%} %>
		
		<% for(int i = 1; i<9; i++){ %>
			<% if(shekelDeletedAvaliableCities[i]){ %>
				<% if(dollarDeletedUsers!=null){ %>
					<% number=1; %>
					<% customerBalance = BigDecimal.ZERO; %>
					<div class="report_title">
						<%= prop.get(GCConstants.MSG_REPORTS_BALANCE_NAME_SHEKEL)+" ("+prop.get(GCConstants.PROP_CITY_PREFIX+i)+") "+prop.get(GCConstants.MSG_REPORTS_DELETED, null)  %>
					</div>
					<div style="clear: both;"></div>
					<table>
						<tr>
							<th style="width: 50px"><%= "#" %></th>
							<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_BALANCE_REPORT_CUSTOMER_NUMBER) %></th>
							<th style="width: 200px"><%= prop.get(GCConstants.MSG_REPORTS_BALANCE_REPORT_CUSTOMER_NAME) %></th>
							<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_BALANCE_REPORT_CITY) %></th>
							<th style="width: 150px"><%= prop.get(GCConstants.MSG_REPORTS_BALANCE_REPORT_BALANCE)+"<br/>"+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"12", null) %></th>
						</tr>
						<% for(GCUser user : dollarDeletedUsers){ %>
							<%if(user.getCity()==i){ %>
								<tr>
									<td style="text-align: center;"><%= number++ %></td>
									<td><%= user.getUserNumber() %></td>
									<td><%= user.getFullName() %></td>
									<td><%= prop.get(GCConstants.PROP_CITY_PREFIX+user.getCity(), null) %></td>
									<td><%= user.getBalance() %></td>
								</tr>
								<% customerBalance=customerBalance.add(new BigDecimal(user.getBalance())); %>
								<% currency=user.getCurrencyID(); %>
							<%} %>
						<%} %>
						<tr>
							<td style="border: 0" colspan="3"></td>
							<td style="border: 0; text-align: center;font-weight: bold;"><%=prop.get(GCConstants.MSG_REPORTS_BALANCE_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+currency, null)  %></td>
							<td style="font-weight: bold;"><%=customerBalance.toString()%></td>
						</tr>
					</table>
				<%} %>
			<%} %>
		<%} %>
		</div>
	</body>
</html>