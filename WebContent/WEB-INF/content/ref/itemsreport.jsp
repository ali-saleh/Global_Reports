<%@page import="beans.GCItem"%>
<%@page import="beans.GCItemRPT"%>
<%@page import="beans.GCPayment"%>
<%@page import="bl.JBillingSrvImp"%>
<%@page import="beans.GCInvoice"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="beans.GCConstants"%>
<%@page import="java.util.List"%>
<%@page import="beans.GCUser"%>
<%@page import="utils.GCProperties"%>
<% 
	GCProperties prop = GCProperties.getSystemProperties();
	List<GCItemRPT> itemsReportShekel = (List<GCItemRPT>)request.getAttribute(GCConstants.FLD_REPORTS_ITEMS_SHEKEL);
	List<GCItemRPT> itemsReportDollar = (List<GCItemRPT>)request.getAttribute(GCConstants.FLD_REPORTS_ITEMS_DOLLAR);
	List<GCItemRPT> itemsReportShekelDeleted = (List<GCItemRPT>)request.getAttribute(GCConstants.FLD_REPORTS_ITEMS_SHEKEL_DELETED);
	List<GCItemRPT> itemsReportDollarDeleted = (List<GCItemRPT>)request.getAttribute(GCConstants.FLD_REPORTS_ITEMS_DOLLAR_DELETED);
	List<GCItem> items = (List<GCItem>)request.getAttribute(GCConstants.FLD_REPORTS_ITEMS);
	String cityIDString = (String)request.getAttribute(GCConstants.FLD_USR_CITY);
	String fromDateString = (String)request.getAttribute(GCConstants.FLD_REPORTS_DATE_FROM);
	String toDateString = (String)request.getAttribute(GCConstants.FLD_REPORTS_DATE_TO);
	String itemID = (String)request.getAttribute(GCConstants.FLD_REPORTS_ITEM);
	BigDecimal customerBalance = BigDecimal.ZERO;
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
			<%= prop.get(GCConstants.MSG_REPORTS_ITEMS_REPORT_TITLE, null) %>
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
					<%= prop.get(GCConstants.MSG_REPORTS_FROM_DATE, null)+" "+fromDateString %>
				</div>
				<div class="report_to_date">
					<%= prop.get(GCConstants.MSG_REPORTS_TO_DATE, null)+" "+toDateString %>
				</div>
			</div>
			<div class="report_payway">
				<% if(itemID.equals("0")){ %>
					<%= prop.get(GCConstants.MSG_REPORTS_ALL_ITEM, null) %>
				<%} else{ %>
					<%= prop.get(GCConstants.MSG_REPORTS_ITEM, null)+": " %>
					<% for(GCItem item: items){ %>
						<%if(item.getId().toString().compareTo(itemID)==0){ %>
							<%=item.getDescription() %>
						<%} %>
					<%} %>
				<%} %>
			</div>
		</div>
		<div class="seperator"></div>
		<div class="seperator"></div>
		<% if(itemsReportShekel!=null){ %>
		<% customerBalance = BigDecimal.ZERO; %>
			<div class="report_title">
				<%= prop.get(GCConstants.MSG_REPORTS_ITEM_SHEKEL, null) %>
			</div>
			<div style="clear: both;"></div>
			<table>
				<tr>
					<th style="width: 50px;"><%= prop.get(GCConstants.MSG_REPORTS_ITEM_ITEM_ID, null) %></th>
					<th style="width: 250px;"><%= prop.get(GCConstants.MSG_REPORTS_ITEM_ITEM_DESCRIPTION, null) %></th>
					<th style="width: 50px;"><%= prop.get(GCConstants.MSG_REPORTS_ITEM_ITEM_QUANTITY, null) %></th>
					<th style="width: 50px;"><%= prop.get(GCConstants.MSG_REPORTS_ITEM_ITEM_ORDERS, null) %></th>
					<th style="width: 100px;"><%= prop.get(GCConstants.MSG_REPORTS_ITEM_ITEM_COST, null)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"12") %></th>
				</tr>
				<% for(GCItemRPT item:itemsReportShekel){ %>
					<tr>
						<td style="text-align: center;"><%= item.getItemID() %></td>
						<td>
						<% for(GCItem findItem:items){ %>
							<% if(item.getItemID().compareTo(findItem.getId())==0){ %>
								<%= findItem.getDescription() %>
							<%} %>
						<%} %>
						</td>
						<td style="text-align: center;"><%= item.getItemQnt() %></td>
						<td style="text-align: center;"><%= item.getNumOfOrders() %></td>
						<td><%= item.getAmount() %></td>
					</tr>
					<% customerBalance=customerBalance.add(item.getAmount()); %>
				<%} %>
				<tr>
				<td style="border: 0;" colspan="2"></td>
				<td style="font-weight: bold; border: 0;" colspan="2"><%=prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"12", null) %></td>
				<td style="font-weight: bold;"><%=customerBalance.toString()+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX+"12") %></td>
				</tr>
			</table>
		<%} %>
		
		<% if(itemsReportDollar!=null){ %>
		<% customerBalance = BigDecimal.ZERO; %>
			<div class="report_title">
				<%= prop.get(GCConstants.MSG_REPORTS_ITEM_DOLLAR, null) %>
			</div>
			<div style="clear: both;"></div>
			<table>
				<tr>
					<th style="width: 50px;"><%= prop.get(GCConstants.MSG_REPORTS_ITEM_ITEM_ID, null) %></th>
					<th style="width: 250px;"><%= prop.get(GCConstants.MSG_REPORTS_ITEM_ITEM_DESCRIPTION, null) %></th>
					<th style="width: 50px;"><%= prop.get(GCConstants.MSG_REPORTS_ITEM_ITEM_QUANTITY, null) %></th>
					<th style="width: 50px;"><%= prop.get(GCConstants.MSG_REPORTS_ITEM_ITEM_ORDERS, null) %></th>
					<th style="width: 100px;"><%= prop.get(GCConstants.MSG_REPORTS_ITEM_ITEM_COST, null)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"1") %></th>
				</tr>
				<% for(GCItemRPT item:itemsReportDollar){ %>
					<tr>
						<td style="text-align: center;"><%= item.getItemID() %></td>
						<td>
						<% for(GCItem findItem:items){ %>
							<% if(item.getItemID().compareTo(findItem.getId())==0){ %>
								<%= findItem.getDescription() %>
							<%} %>
						<%} %>
						</td>
						<td style="text-align: center;"><%= item.getItemQnt() %></td>
						<td style="text-align: center;"><%= item.getNumOfOrders() %></td>
						<td><%= item.getAmount() %></td>
					</tr>
					<% customerBalance=customerBalance.add(item.getAmount()); %>
				<%} %>
				<tr>
				<td style="border: 0;" colspan="2"></td>
				<td style="font-weight: bold; border: 0;" colspan="2"><%=prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"1", null) %></td>
				<td style="font-weight: bold;"><%=customerBalance.toString()+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX+"1") %></td>
				</tr>
			</table>
		<%} %>
		
		<% if(itemsReportShekelDeleted!=null){ %>
		<% customerBalance = BigDecimal.ZERO; %>
			<div class="report_title">
				<%= prop.get(GCConstants.MSG_REPORTS_ITEM_SHEKEL_DELETED, null) %>
			</div>
			<div style="clear: both;"></div>
			<table>
				<tr>
					<th style="width: 50px;"><%= prop.get(GCConstants.MSG_REPORTS_ITEM_ITEM_ID, null) %></th>
					<th style="width: 250px;"><%= prop.get(GCConstants.MSG_REPORTS_ITEM_ITEM_DESCRIPTION, null) %></th>
					<th style="width: 50px;"><%= prop.get(GCConstants.MSG_REPORTS_ITEM_ITEM_QUANTITY, null) %></th>
					<th style="width: 50px;"><%= prop.get(GCConstants.MSG_REPORTS_ITEM_ITEM_ORDERS, null) %></th>
					<th style="width: 100px;"><%= prop.get(GCConstants.MSG_REPORTS_ITEM_ITEM_COST, null)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"12") %></th>
				</tr>
				<% for(GCItemRPT item:itemsReportShekelDeleted){ %>
					<tr>
						<td style="text-align: center;"><%= item.getItemID() %></td>
						<td>
						<% for(GCItem findItem:items){ %>
							<% if(item.getItemID().compareTo(findItem.getId())==0){ %>
								<%= findItem.getDescription() %>
							<%} %>
						<%} %>
						</td>
						<td style="text-align: center;"><%= item.getItemQnt() %></td>
						<td style="text-align: center;"><%= item.getNumOfOrders() %></td>
						<td><%= item.getAmount() %></td>
					</tr>
					<% customerBalance=customerBalance.add(item.getAmount()); %>
				<%} %>
				<tr>
				<td style="border: 0;" colspan="2"></td>
				<td style="font-weight: bold; border: 0;" colspan="2"><%=prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"12", null) %></td>
				<td style="font-weight: bold;"><%=customerBalance.toString()+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX+"12") %></td>
				</tr>
			</table>
		<%} %>
		
		<% if(itemsReportDollarDeleted!=null){ %>
		<% customerBalance = BigDecimal.ZERO; %>
			<div class="report_title">
				<%= prop.get(GCConstants.MSG_REPORTS_ITEM_DOLLAR_DELETED, null) %>
			</div>
			<div style="clear: both;"></div>
			<table>
				<tr>
					<th style="width: 50px;"><%= prop.get(GCConstants.MSG_REPORTS_ITEM_ITEM_ID, null) %></th>
					<th style="width: 250px;"><%= prop.get(GCConstants.MSG_REPORTS_ITEM_ITEM_DESCRIPTION, null) %></th>
					<th style="width: 50px;"><%= prop.get(GCConstants.MSG_REPORTS_ITEM_ITEM_QUANTITY, null) %></th>
					<th style="width: 50px;"><%= prop.get(GCConstants.MSG_REPORTS_ITEM_ITEM_ORDERS, null) %></th>
					<th style="width: 100px;"><%= prop.get(GCConstants.MSG_REPORTS_ITEM_ITEM_COST, null)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"1") %></th>
				</tr>
				<% for(GCItemRPT item:itemsReportDollarDeleted){ %>
					<tr>
						<td style="text-align: center;"><%= item.getItemID() %></td>
						<td>
						<% for(GCItem findItem:items){ %>
							<% if(item.getItemID().compareTo(findItem.getId())==0){ %>
								<%= findItem.getDescription() %>
							<%} %>
						<%} %>
						</td>
						<td style="text-align: center;"><%= item.getItemQnt() %></td>
						<td style="text-align: center;"><%= item.getNumOfOrders() %></td>
						<td><%= item.getAmount() %></td>
					</tr>
					<% customerBalance=customerBalance.add(item.getAmount()); %>
				<%} %>
				<tr>
				<td style="border: 0;" colspan="2"></td>
				<td style="font-weight: bold; border: 0;" colspan="2"><%=prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"1", null) %></td>
				<td style="font-weight: bold;"><%=customerBalance.toString()+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX+"1") %></td>
				</tr>
			</table>
		<%} %>
		</div>
	</body>
</html>