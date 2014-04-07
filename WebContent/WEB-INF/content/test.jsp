<html>
<head>
<link rel="stylesheet" type="text/css"
	href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/test.js"></script>
</head>
<body>

	<button id="btnTest" name="My Button" value="Click Me"
		onclick="ali_test()" style="width: 50; height: 25;" class="testBtn"></button>

	<!-- 	<table id="example"> -->
	<!-- 		<thead> -->
	<!-- 			<tr> -->
	<!-- 				<th>Sites</th> -->
	<!-- 			</tr> -->
	<!-- 		</thead> -->
	<!-- 		<tbody> -->
	<!-- 			<tr> -->
	<!-- 				<td>SitePoint</td> -->
	<!-- 			</tr> -->
	<!-- 			<tr> -->
	<!-- 				<td>Learnable</td> -->
	<!-- 			</tr> -->
	<!-- 			<tr> -->
	<!-- 				<td>Flippa</td> -->
	<!-- 			</tr> -->
	<!-- 		</tbody> -->
	<!-- 	</table> -->
</body>
</html>



<%-- <%@page import="java.util.ArrayList"%> --%>
<%-- <%@page import="beans.GCOrder"%> --%>
<%-- <%@page import="bl.JBillingSrvImp"%> --%>
<%-- <%@page import="beans.GCInvoice"%> --%>
<%-- <%@page import="java.math.BigDecimal"%> --%>
<%-- <%@page import="beans.GCConstants"%> --%>
<%-- <%@page import="java.util.List"%> --%>
<%-- <%@page import="beans.GCUser"%> --%>
<%-- <%@page import="utils.GCProperties"%> --%>
<%-- <%  --%>
// GCProperties prop = GCProperties.getSystemProperties();
// List<GCInvoice> dollarInvoices = (List<GCInvoice>)request.getAttribute(GCConstants.FLD_REPORTS_INVOICE_DOLLAR);
// List<GCInvoice> dollarDeletedInvoices = (List<GCInvoice>)request.getAttribute(GCConstants.FLD_REPORTS_INVOICE_DOLLAR_DELETED);
// List<GCInvoice> shekelInvoices = (List<GCInvoice>)request.getAttribute(GCConstants.FLD_REPORTS_INVOICE_SHEKEL);
// List<GCInvoice> shekelDeletedInvoices = (List<GCInvoice>)request.getAttribute(GCConstants.FLD_REPORTS_INVOICE_SHEKEL_DELETED);
// String viewPaidInvoices= (String)request.getAttribute(GCConstants.FLD_REPORTS_INVOICE_REPORT_PAID);
// String viewUnPaidInvoices= (String)request.getAttribute(GCConstants.FLD_REPORTS_INVOICE_REPORT_UNPAID);
// String cityIDString = (String)request.getAttribute(GCConstants.FLD_USR_CITY);
// String fromDateString = (String)request.getAttribute(GCConstants.FLD_REPORTS_DATE_FROM);
// String toDateString = (String)request.getAttribute(GCConstants.FLD_REPORTS_DATE_TO);

// List<GCInvoice> dollarPaidInvoices = new ArrayList<GCInvoice>();
// List<GCInvoice> dollarUnPaidInvoices = new ArrayList<GCInvoice>();
// List<GCInvoice> dollarPaidDeletedInvoices = new ArrayList<GCInvoice>();
// List<GCInvoice> dollarUnPaidDeletedInvoices = new ArrayList<GCInvoice>();
// List<GCInvoice> shekelPaidInvoices = new ArrayList<GCInvoice>();
// List<GCInvoice> shekelUnPaidInvoices = new ArrayList<GCInvoice>();
// List<GCInvoice> shekelPaidDeletedInvoices = new ArrayList<GCInvoice>();
// List<GCInvoice> shekelUnPaidDeletedInvoices = new ArrayList<GCInvoice>();

// if(shekelInvoices!=null){
// 	for(GCInvoice invoice:shekelInvoices){
// 		if(invoice.getInvoiceStatusId()==1 && viewPaidInvoices!=null){
// 			shekelPaidInvoices.add(invoice);
// 		}else if(viewUnPaidInvoices!=null && invoice.getInvoiceStatusId()!=1){
// 			shekelUnPaidInvoices.add(invoice);
// 		}
// 	}
// }

// if(shekelDeletedInvoices!=null){
// 	for(GCInvoice invoice:shekelDeletedInvoices){
// 		if(invoice.getInvoiceStatusId()==1 && viewPaidInvoices!=null){
// 			shekelPaidDeletedInvoices.add(invoice);
// 		}else if(viewUnPaidInvoices!=null && invoice.getInvoiceStatusId()!=1){
// 			shekelUnPaidDeletedInvoices.add(invoice);
// 		}
// 	}
// }

// if(dollarInvoices!=null){
// 	for(GCInvoice invoice:dollarInvoices){
// 		if(invoice.getInvoiceStatusId()==1 && viewPaidInvoices!=null){
// 			dollarPaidInvoices.add(invoice);
// 		}else if(viewUnPaidInvoices!=null && invoice.getInvoiceStatusId()!=1){
// 			dollarUnPaidInvoices.add(invoice);
// 		}
// 	}
// }

// if(dollarDeletedInvoices!=null){
// 	for(GCInvoice invoice:dollarDeletedInvoices){
// 		if(invoice.getInvoiceStatusId()==1 && viewPaidInvoices!=null){
// 			dollarPaidDeletedInvoices.add(invoice);
// 		}else if(viewUnPaidInvoices!=null && invoice.getInvoiceStatusId()!=1){
// 			dollarUnPaidDeletedInvoices.add(invoice);
// 		}
// 	}
// }



// BigDecimal customerBalance = BigDecimal.ZERO;
// int currency =0;
// int number=1;
// int forCounter=0;
<%-- %> --%>

<!-- <html> -->
<!-- 	<head> -->
<!-- 		<meta http-equiv="Content-Type" content="text/html; charset=windows-1256"> -->
<!-- 		<link rel="stylesheet" type="text/css" href="./client/css/reports.css" /> -->
<!-- 		<title> -->
		
<!-- 		</title> -->
<!-- 	</head> -->
<!-- 	<body> -->
<!-- 		<div class="report_results_page balance_results_report"> -->
<!-- 		<div class="report_main_title"> -->
<%-- 			<%= prop.get(GCConstants.MSG_REPORTS_INVOICE_REPORT_TITLE, null) %> --%>
<!-- 		</div> -->
<!-- 		<div class="report_logo"> -->
<!-- 			<img alt="logo" src="./client/images/logobw.png"> -->
<!-- 		</div> -->
<!-- 		<div style="clear:both;"></div> -->
<!-- 		<div class="seperator"></div> -->
<!-- 		<div class="seperator"></div> -->
<!-- 		<div class="report_info"> -->
<!-- 			<div class="report_city"> -->
<%-- 				<% if(cityIDString.equals("0")){ %> --%>
<%-- 					<%= prop.get(GCConstants.MSG_REPORTS_ALL_CITIES, null) %> --%>
<%-- 				<%}else{ %> --%>
<%-- 					<%= prop.get(GCConstants.MSG_REPORTS_ONE_CITY, null)+" "+prop.get(GCConstants.PROP_CITY_PREFIX+cityIDString, null) %> --%>
<%-- 				<%} %> --%>
<!-- 			</div> -->
<!-- 			<div class="report_date"> -->
<!-- 				<div class="report_from_date"> -->
<%-- 					<%= prop.get(GCConstants.MSG_REPORTS_FROM_DATE, null)+" "+fromDateString %> --%>
<!-- 				</div> -->
<!-- 				<div class="report_to_date"> -->
<%-- 					<%= prop.get(GCConstants.MSG_REPORTS_TO_DATE, null)+" "+toDateString %> --%>
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="seperator"></div> -->
<!-- 		<div class="seperator"></div> -->
<!-- 		<div style="clear: both;"></div> -->
<%-- 			<% if(dollarPaidInvoices!=null && !dollarPaidInvoices.isEmpty()){ %> --%>
<%-- 			<% number=1; %> --%>
<%-- 			<% customerBalance = BigDecimal.ZERO; %> --%>
<!-- 			<div class="report_title"> -->
<%-- 				<%= prop.get(GCConstants.MSG_REPORTS_INVOICE_NAME_DOLLAR) %> --%>
<!-- 			</div> -->
<!-- 			<div style="clear: both;"></div> -->
<!-- 				<table> -->
<!-- 					<tr> -->
<%-- 						<th style="width: 20px"><%= "#" %></th> --%>
<%-- 						<th style="width: 40px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_NUMBER) %></th> --%>
<%-- 						<th style="width: 90px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_CUSTOMER_NUMBER) %></th> --%>
<%-- 						<th style="width: 130px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_CUSTOMER_NAME) %></th> --%>
<%-- 						<th style="width: 80px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_DATE) %></th> --%>
<%-- 						<th style="width: 60px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_STATUS) %></th> --%>
<%-- 						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_PAYMENTS) %></th> --%>
<%-- 						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_BALANCE)+"<br /> "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"1", null) %></th> --%>
<!-- 					</tr> -->
<%-- 				<% for(GCInvoice invoice : dollarPaidInvoices){ %> --%>
<!-- 					<tr> -->
<%-- 						<td style="text-align: center;"><%= number++ %></td> --%>
<%-- 						<td><%= invoice.getInvoiceId() %></td> --%>
<%-- 						<td><%= invoice.getCustomerNumber() %></td> --%>
<%-- 						<td><%= invoice.getCustomerFullname() %></td> --%>
<%-- 						<td><%= JBillingSrvImp.DF.format(invoice.getInvoiceDate()) %></td> --%>
<%-- 						<td><%= prop.get(GCConstants.PROP_INVOICE_STATUS_PREFIX+invoice.getInvoiceStatusId(), null) %></td> --%>
<!-- 						<td> -->
<%-- 							<%if(invoice.getPaymentIds()!=null){ %> --%>
<%-- 								<%forCounter=0; %> --%>
<%-- 								<%for(int i : invoice.getPaymentIds()){ %> --%>
<%-- 									<% if(forCounter!=0){%> --%>
<%-- 										<%= prop.get(GCConstants.MSG_USR_PAYMENT_INVOICE_IDS_SEP) %> --%>
<%-- 									<%} %> --%>
<%-- 									<% forCounter++; %> --%>
<%-- 									<%=i %> --%>
<%-- 								<%} %> --%>
<%-- 							<%} %> --%>
<!-- 						</td> -->
<%-- 						<td><%= invoice.getTotal() %></td> --%>
<!-- 					</tr> -->
<%-- 					<% customerBalance=customerBalance.add(new BigDecimal(invoice.getTotal())); %> --%>
<%-- 					<% currency=invoice.getCurrencyId(); %> --%>
<%-- 				<%} %> --%>
<!-- 					<tr> -->
<!-- 						<td style="border: 0" colspan="6"></td> -->
<%-- 						<td style="border: 0; text-align: center;font-weight: bold;"><%=prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+currency, null) %></td> --%>
<%-- 						<td style="font-weight: bold;"><%=customerBalance.toString() %></td> --%>
<!-- 					</tr> -->
<!-- 				</table> -->
<%-- 			<%} %> --%>
<!-- 			<div style="clear: both;"></div> -->
<%-- 			<% if(dollarUnPaidInvoices!=null && !dollarUnPaidInvoices.isEmpty()){ %> --%>
<%-- 			<% number=1; %> --%>
<%-- 			<% customerBalance = BigDecimal.ZERO; %> --%>
<!-- 			<div class="report_title"> -->
<%-- 				<%= prop.get(GCConstants.MSG_REPORTS_INVOICE_NAME_DOLLAR) %> --%>
<!-- 			</div> -->
<!-- 			<div style="clear: both;"></div> -->
<!-- 				<table> -->
<!-- 					<tr> -->
<%-- 						<th style="width: 20px"><%= "#" %></th> --%>
<%-- 						<th style="width: 40px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_NUMBER) %></th> --%>
<%-- 						<th style="width: 90px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_CUSTOMER_NUMBER) %></th> --%>
<%-- 						<th style="width: 130px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_CUSTOMER_NAME) %></th> --%>
<%-- 						<th style="width: 80px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_DATE) %></th> --%>
<%-- 						<th style="width: 60px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_STATUS) %></th> --%>
<%-- 						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_PAYMENTS) %></th> --%>
<%-- 						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_BALANCE)+"<br /> "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"1", null) %></th> --%>
<!-- 					</tr> -->
<%-- 				<% for(GCInvoice invoice : dollarUnPaidInvoices){ %> --%>
<!-- 					<tr> -->
<%-- 						<td style="text-align: center;"><%= number++ %></td> --%>
<%-- 						<td><%= invoice.getInvoiceId() %></td> --%>
<%-- 						<td><%= invoice.getCustomerNumber() %></td> --%>
<%-- 						<td><%= invoice.getCustomerFullname() %></td> --%>
<%-- 						<td><%= JBillingSrvImp.DF.format(invoice.getInvoiceDate()) %></td> --%>
<%-- 						<td><%= prop.get(GCConstants.PROP_INVOICE_STATUS_PREFIX+invoice.getInvoiceStatusId(), null) %></td> --%>
<!-- 						<td> -->
<%-- 							<%if(invoice.getPaymentIds()!=null){ %> --%>
<%-- 								<%forCounter=0; %> --%>
<%-- 								<%for(int i : invoice.getPaymentIds()){ %> --%>
<%-- 									<% if(forCounter!=0){%> --%>
<%-- 										<%= prop.get(GCConstants.MSG_USR_PAYMENT_INVOICE_IDS_SEP) %> --%>
<%-- 									<%} %> --%>
<%-- 									<% forCounter++; %> --%>
<%-- 									<%=i %> --%>
<%-- 								<%} %> --%>
<%-- 							<%} %> --%>
<!-- 						</td> -->
<%-- 						<td><%= invoice.getTotal() %></td> --%>
<!-- 					</tr> -->
<%-- 					<% customerBalance=customerBalance.add(new BigDecimal(invoice.getTotal())); %> --%>
<%-- 					<% currency=invoice.getCurrencyId(); %> --%>
<%-- 				<%} %> --%>
<!-- 					<tr> -->
<!-- 						<td style="border: 0" colspan="6"></td> -->
<%-- 						<td style="border: 0; text-align: center;font-weight: bold;"><%=prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+currency, null) %></td> --%>
<%-- 						<td style="font-weight: bold;"><%=customerBalance.toString() %></td> --%>
<!-- 					</tr> -->
<!-- 				</table> -->
<%-- 			<%} %> --%>
			
<%-- 			<% if(shekelPaidInvoices!=null && !shekelPaidInvoices.isEmpty()){ %> --%>
<%-- 			<% number=1; %> --%>
<%-- 			<% customerBalance = BigDecimal.ZERO; %> --%>
<!-- 			<div class="report_title"> -->
<%-- 				<%= prop.get(GCConstants.MSG_REPORTS_INVOICE_NAME_SHEKEL) %> --%>
<!-- 			</div> -->
<!-- 			<div style="clear: both;"></div> -->
<!-- 				<table> -->
<!-- 					<tr> -->
<%-- 						<th style="width: 20px"><%= "#" %></th> --%>
<%-- 						<th style="width: 40px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_NUMBER) %></th> --%>
<%-- 						<th style="width: 90px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_CUSTOMER_NUMBER) %></th> --%>
<%-- 						<th style="width: 130px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_CUSTOMER_NAME) %></th> --%>
<%-- 						<th style="width: 80px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_DATE) %></th> --%>
<%-- 						<th style="width: 60px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_STATUS) %></th> --%>
<%-- 						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_PAYMENTS) %></th> --%>
<%-- 						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_BALANCE)+"<br /> "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"12", null)  %></th> --%>
<!-- 					</tr> -->
<%-- 				<% for(GCInvoice invoice : shekelPaidInvoices){ %> --%>
<!-- 					<tr> -->
<%-- 						<td style="text-align: center;"><%= number++ %></td> --%>
<%-- 						<td><%= invoice.getInvoiceId() %></td> --%>
<%-- 						<td><%= invoice.getCustomerNumber() %></td> --%>
<%-- 						<td><%= invoice.getCustomerFullname() %></td> --%>
<%-- 						<td><%= JBillingSrvImp.DF.format(invoice.getInvoiceDate()) %></td> --%>
<%-- 						<td><%= prop.get(GCConstants.PROP_INVOICE_STATUS_PREFIX+invoice.getInvoiceStatusId(), null) %></td> --%>
<!-- 						<td> -->
<%-- 							<%if(invoice.getPaymentIds()!=null){ %> --%>
<%-- 								<%forCounter=0; %> --%>
<%-- 								<%for(int i : invoice.getPaymentIds()){ %> --%>
<%-- 									<% if(forCounter!=0){%> --%>
<%-- 										<%= prop.get(GCConstants.MSG_USR_PAYMENT_INVOICE_IDS_SEP) %> --%>
<%-- 									<%} %> --%>
<%-- 									<% forCounter++; %> --%>
<%-- 									<%=i %> --%>
<%-- 								<%} %> --%>
<%-- 							<%} %> --%>
<!-- 						</td> -->
<%-- 						<td><%= invoice.getTotal() %></td> --%>
<!-- 					</tr> -->
<%-- 					<% customerBalance=customerBalance.add(new BigDecimal(invoice.getTotal())); %> --%>
<%-- 					<% currency=invoice.getCurrencyId(); %>				<%} %> --%>
<!-- 					<tr> -->
<!-- 						<td style="border: 0" colspan="6"></td> -->
<%-- 						<td style="border: 0; text-align: center;font-weight: bold;"><%=prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+currency, null) %></td> --%>
<%-- 						<td style="font-weight: bold;"><%=customerBalance.toString() %></td> --%>
<!-- 					</tr> -->
<!-- 				</table> -->
<%-- 			<%} %> --%>
			
<%-- 			<% if(shekelUnPaidInvoices!=null && !shekelUnPaidInvoices.isEmpty()){ %> --%>
<%-- 			<% number=1; %> --%>
<%-- 			<% customerBalance = BigDecimal.ZERO; %> --%>
<!-- 			<div class="report_title"> -->
<%-- 				<%= prop.get(GCConstants.MSG_REPORTS_INVOICE_NAME_SHEKEL) %> --%>
<!-- 			</div> -->
<!-- 			<div style="clear: both;"></div> -->
<!-- 				<table> -->
<!-- 					<tr> -->
<%-- 						<th style="width: 20px"><%= "#" %></th> --%>
<%-- 						<th style="width: 40px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_NUMBER) %></th> --%>
<%-- 						<th style="width: 90px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_CUSTOMER_NUMBER) %></th> --%>
<%-- 						<th style="width: 130px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_CUSTOMER_NAME) %></th> --%>
<%-- 						<th style="width: 80px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_DATE) %></th> --%>
<%-- 						<th style="width: 60px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_STATUS) %></th> --%>
<%-- 						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_PAYMENTS) %></th> --%>
<%-- 						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_BALANCE)+"<br /> "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"12", null)  %></th> --%>
<!-- 					</tr> -->
<%-- 				<% for(GCInvoice invoice : shekelUnPaidInvoices){ %> --%>
<!-- 					<tr> -->
<%-- 						<td style="text-align: center;"><%= number++ %></td> --%>
<%-- 						<td><%= invoice.getInvoiceId() %></td> --%>
<%-- 						<td><%= invoice.getCustomerNumber() %></td> --%>
<%-- 						<td><%= invoice.getCustomerFullname() %></td> --%>
<%-- 						<td><%= JBillingSrvImp.DF.format(invoice.getInvoiceDate()) %></td> --%>
<%-- 						<td><%= prop.get(GCConstants.PROP_INVOICE_STATUS_PREFIX+invoice.getInvoiceStatusId(), null) %></td> --%>
<!-- 						<td> -->
<%-- 							<%if(invoice.getPaymentIds()!=null){ %> --%>
<%-- 								<%forCounter=0; %> --%>
<%-- 								<%for(int i : invoice.getPaymentIds()){ %> --%>
<%-- 									<% if(forCounter!=0){%> --%>
<%-- 										<%= prop.get(GCConstants.MSG_USR_PAYMENT_INVOICE_IDS_SEP) %> --%>
<%-- 									<%} %> --%>
<%-- 									<% forCounter++; %> --%>
<%-- 									<%=i %> --%>
<%-- 								<%} %> --%>
<%-- 							<%} %> --%>
<!-- 						</td> -->
<%-- 						<td><%= invoice.getTotal() %></td> --%>
<!-- 					</tr> -->
<%-- 					<% customerBalance=customerBalance.add(new BigDecimal(invoice.getTotal())); %> --%>
<%-- 					<% currency=invoice.getCurrencyId(); %>				<%} %> --%>
<!-- 					<tr> -->
<!-- 						<td style="border: 0" colspan="6"></td> -->
<%-- 						<td style="border: 0; text-align: center;font-weight: bold;"><%=prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+currency, null) %></td> --%>
<%-- 						<td style="font-weight: bold;"><%=customerBalance.toString() %></td> --%>
<!-- 					</tr> -->
<!-- 				</table> -->
<%-- 			<%} %> --%>

			
			
			
<%-- 			<% if(dollarPaidDeletedInvoices!=null && !dollarPaidDeletedInvoices.isEmpty()){ %> --%>
<%-- 			<% number=1; %> --%>
<%-- 			<% customerBalance = BigDecimal.ZERO; %> --%>
<!-- 			<div class="report_title"> -->
<%-- 				<%= prop.get(GCConstants.MSG_REPORTS_INVOICE_NAME_DOLLAR)+" "+prop.get(GCConstants.MSG_REPORTS_DELETED, null) %> --%>
<!-- 			</div> -->
<!-- 			<div style="clear: both;"></div> -->
<!-- 				<table> -->
<!-- 					<tr> -->
<%-- 						<th style="width: 20px"><%= "#" %></th> --%>
<%-- 						<th style="width: 40px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_NUMBER) %></th> --%>
<%-- 						<th style="width: 90px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_CUSTOMER_NUMBER) %></th> --%>
<%-- 						<th style="width: 130px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_CUSTOMER_NAME) %></th> --%>
<%-- 						<th style="width: 80px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_DATE) %></th> --%>
<%-- 						<th style="width: 60px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_STATUS) %></th> --%>
<%-- 						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_PAYMENTS) %></th> --%>
<%-- 						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_BALANCE)+"<br /> "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"1", null)  %></th> --%>
<!-- 					</tr> -->
<%-- 				<% for(GCInvoice invoice : dollarPaidDeletedInvoices){ %> --%>
<!-- 					<tr> -->
<%-- 						<td style="text-align: center;"><%= number++ %></td> --%>
<%-- 						<td><%= invoice.getInvoiceId() %></td> --%>
<%-- 						<td><%= invoice.getCustomerNumber() %></td> --%>
<%-- 						<td><%= invoice.getCustomerFullname() %></td> --%>
<%-- 						<td><%= JBillingSrvImp.DF.format(invoice.getInvoiceDate()) %></td> --%>
<%-- 						<td><%= prop.get(GCConstants.PROP_INVOICE_STATUS_PREFIX+invoice.getInvoiceStatusId(), null) %></td> --%>
<!-- 						<td> -->
<%-- 							<%if(invoice.getPaymentIds()!=null){ %> --%>
<%-- 								<%forCounter=0; %> --%>
<%-- 								<%for(int i : invoice.getPaymentIds()){ %> --%>
<%-- 									<% if(forCounter!=0){%> --%>
<%-- 										<%= prop.get(GCConstants.MSG_USR_PAYMENT_INVOICE_IDS_SEP) %> --%>
<%-- 									<%} %> --%>
<%-- 									<% forCounter++; %> --%>
<%-- 									<%=i %> --%>
<%-- 								<%} %> --%>
<%-- 							<%} %> --%>
<!-- 						</td> -->
<%-- 						<td><%= invoice.getTotal() %></td> --%>
<!-- 					</tr> -->
<%-- 					<% customerBalance=customerBalance.add(new BigDecimal(invoice.getTotal())); %> --%>
<%-- 					<% currency=invoice.getCurrencyId(); %> --%>
<%-- 				<%} %> --%>
<!-- 					<tr> -->
<!-- 						<td style="border: 0" colspan="6"></td> -->
<%-- 						<td style="border: 0; text-align: center;font-weight: bold;"><%=prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+currency, null) %></td> --%>
<%-- 						<td style="font-weight: bold;"><%=customerBalance.toString() %></td> --%>
<!-- 					</tr> -->
<!-- 				</table> -->
<%-- 			<%} %> --%>
			
<%-- 			<% if(dollarUnPaidDeletedInvoices!=null && !dollarUnPaidDeletedInvoices.isEmpty()){ %> --%>
<%-- 			<% number=1; %> --%>
<%-- 			<% customerBalance = BigDecimal.ZERO; %> --%>
<!-- 			<div class="report_title"> -->
<%-- 				<%= prop.get(GCConstants.MSG_REPORTS_INVOICE_NAME_DOLLAR)+" "+prop.get(GCConstants.MSG_REPORTS_DELETED, null) %> --%>
<!-- 			</div> -->
<!-- 			<div style="clear: both;"></div> -->
<!-- 				<table> -->
<!-- 					<tr> -->
<%-- 						<th style="width: 20px"><%= "#" %></th> --%>
<%-- 						<th style="width: 40px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_NUMBER) %></th> --%>
<%-- 						<th style="width: 90px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_CUSTOMER_NUMBER) %></th> --%>
<%-- 						<th style="width: 130px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_CUSTOMER_NAME) %></th> --%>
<%-- 						<th style="width: 80px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_DATE) %></th> --%>
<%-- 						<th style="width: 60px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_STATUS) %></th> --%>
<%-- 						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_PAYMENTS) %></th> --%>
<%-- 						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_BALANCE)+"<br /> "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"1", null)  %></th> --%>
<!-- 					</tr> -->
<%-- 				<% for(GCInvoice invoice : dollarUnPaidDeletedInvoices){ %> --%>
<!-- 					<tr> -->
<%-- 						<td style="text-align: center;"><%= number++ %></td> --%>
<%-- 						<td><%= invoice.getInvoiceId() %></td> --%>
<%-- 						<td><%= invoice.getCustomerNumber() %></td> --%>
<%-- 						<td><%= invoice.getCustomerFullname() %></td> --%>
<%-- 						<td><%= JBillingSrvImp.DF.format(invoice.getInvoiceDate()) %></td> --%>
<%-- 						<td><%= prop.get(GCConstants.PROP_INVOICE_STATUS_PREFIX+invoice.getInvoiceStatusId(), null) %></td> --%>
<!-- 						<td> -->
<%-- 							<%if(invoice.getPaymentIds()!=null){ %> --%>
<%-- 								<%forCounter=0; %> --%>
<%-- 								<%for(int i : invoice.getPaymentIds()){ %> --%>
<%-- 									<% if(forCounter!=0){%> --%>
<%-- 										<%= prop.get(GCConstants.MSG_USR_PAYMENT_INVOICE_IDS_SEP) %> --%>
<%-- 									<%} %> --%>
<%-- 									<% forCounter++; %> --%>
<%-- 									<%=i %> --%>
<%-- 								<%} %> --%>
<%-- 							<%} %> --%>
<!-- 						</td> -->
<%-- 						<td><%= invoice.getTotal() %></td> --%>
<!-- 					</tr> -->
<%-- 					<% customerBalance=customerBalance.add(new BigDecimal(invoice.getTotal())); %> --%>
<%-- 					<% currency=invoice.getCurrencyId(); %> --%>
<%-- 				<%} %> --%>
<!-- 					<tr> -->
<!-- 						<td style="border: 0" colspan="6"></td> -->
<%-- 						<td style="border: 0; text-align: center;font-weight: bold;"><%=prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+currency, null) %></td> --%>
<%-- 						<td style="font-weight: bold;"><%=customerBalance.toString() %></td> --%>
<!-- 					</tr> -->
<!-- 				</table> -->
<%-- 			<%} %> --%>
			
<%-- 			<% if(shekelPaidDeletedInvoices!=null && !shekelPaidDeletedInvoices.isEmpty()){ %> --%>
<%-- 			<% number=1; %> --%>
<%-- 			<% customerBalance = BigDecimal.ZERO; %> --%>
<!-- 			<div class="report_title"> -->
<%-- 				<%= prop.get(GCConstants.MSG_REPORTS_INVOICE_NAME_SHEKEL)+" "+prop.get(GCConstants.MSG_REPORTS_DELETED, null) %> --%>
<!-- 			</div> -->
<!-- 			<div style="clear: both;"></div> -->
<!-- 				<table> -->
<!-- 					<tr> -->
<%-- 						<th style="width: 20px"><%= "#" %></th> --%>
<%-- 						<th style="width: 40px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_NUMBER) %></th> --%>
<%-- 						<th style="width: 90px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_CUSTOMER_NUMBER) %></th> --%>
<%-- 						<th style="width: 130px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_CUSTOMER_NAME) %></th> --%>
<%-- 						<th style="width: 80px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_DATE) %></th> --%>
<%-- 						<th style="width: 60px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_STATUS) %></th> --%>
<%-- 						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_PAYMENTS) %></th> --%>
<%-- 						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_BALANCE)+"<br /> "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"12", null)  %></th> --%>
<!-- 					</tr> -->
<%-- 				<% for(GCInvoice invoice : shekelPaidDeletedInvoices){ %> --%>
<!-- 					<tr> -->
<%-- 						<td style="text-align: center;"><%= number++ %></td> --%>
<%-- 						<td><%= invoice.getInvoiceId() %></td> --%>
<%-- 						<td><%= invoice.getCustomerNumber() %></td> --%>
<%-- 						<td><%= invoice.getCustomerFullname() %></td> --%>
<%-- 						<td><%= JBillingSrvImp.DF.format(invoice.getInvoiceDate()) %></td> --%>
<%-- 						<td><%= prop.get(GCConstants.PROP_INVOICE_STATUS_PREFIX+invoice.getInvoiceStatusId(), null) %></td> --%>
<!-- 						<td> -->
<%-- 							<%if(invoice.getPaymentIds()!=null){ %> --%>
<%-- 								<%forCounter=0; %> --%>
<%-- 								<%for(int i : invoice.getPaymentIds()){ %> --%>
<%-- 									<% if(forCounter!=0){%> --%>
<%-- 										<%= prop.get(GCConstants.MSG_USR_PAYMENT_INVOICE_IDS_SEP) %> --%>
<%-- 									<%} %> --%>
<%-- 									<% forCounter++; %> --%>
<%-- 									<%=i %> --%>
<%-- 								<%} %> --%>
<%-- 							<%} %> --%>
<!-- 						</td> -->
<%-- 						<td><%= invoice.getTotal() %></td> --%>
<!-- 					</tr> -->
<%-- 					<% customerBalance=customerBalance.add(new BigDecimal(invoice.getTotal())); %> --%>
<%-- 					<% currency=invoice.getCurrencyId(); %> --%>
<%-- 				<%} %> --%>
<!-- 					<tr> -->
<!-- 						<td style="border: 0" colspan="6"></td> -->
<%-- 						<td style="border: 0; text-align: center;font-weight: bold;"><%=prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+currency, null) %></td> --%>
<%-- 						<td style="font-weight: bold;"><%=customerBalance.toString() %></td> --%>
<!-- 					</tr> -->
<!-- 				</table> -->
<%-- 			<%} %> --%>
			
<%-- 			<% if(shekelUnPaidDeletedInvoices!=null && !shekelUnPaidDeletedInvoices.isEmpty()){ %> --%>
<%-- 			<% number=1; %> --%>
<%-- 			<% customerBalance = BigDecimal.ZERO; %> --%>
<!-- 			<div class="report_title"> -->
<%-- 				<%= prop.get(GCConstants.MSG_REPORTS_INVOICE_NAME_SHEKEL)+" "+prop.get(GCConstants.MSG_REPORTS_DELETED, null) %> --%>
<!-- 			</div> -->
<!-- 			<div style="clear: both;"></div> -->
<!-- 				<table> -->
<!-- 					<tr> -->
<%-- 						<th style="width: 20px"><%= "#" %></th> --%>
<%-- 						<th style="width: 40px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_NUMBER) %></th> --%>
<%-- 						<th style="width: 90px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_CUSTOMER_NUMBER) %></th> --%>
<%-- 						<th style="width: 130px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_CUSTOMER_NAME) %></th> --%>
<%-- 						<th style="width: 80px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_DATE) %></th> --%>
<%-- 						<th style="width: 60px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_STATUS) %></th> --%>
<%-- 						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_INVOICE_PAYMENTS) %></th> --%>
<%-- 						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_BALANCE)+"<br /> "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"12", null)  %></th> --%>
<!-- 					</tr> -->
<%-- 				<% for(GCInvoice invoice : shekelUnPaidDeletedInvoices){ %> --%>
<!-- 					<tr> -->
<%-- 						<td style="text-align: center;"><%= number++ %></td> --%>
<%-- 						<td><%= invoice.getInvoiceId() %></td> --%>
<%-- 						<td><%= invoice.getCustomerNumber() %></td> --%>
<%-- 						<td><%= invoice.getCustomerFullname() %></td> --%>
<%-- 						<td><%= JBillingSrvImp.DF.format(invoice.getInvoiceDate()) %></td> --%>
<%-- 						<td><%= prop.get(GCConstants.PROP_INVOICE_STATUS_PREFIX+invoice.getInvoiceStatusId(), null) %></td> --%>
<!-- 						<td> -->
<%-- 							<%if(invoice.getPaymentIds()!=null){ %> --%>
<%-- 								<%forCounter=0; %> --%>
<%-- 								<%for(int i : invoice.getPaymentIds()){ %> --%>
<%-- 									<% if(forCounter!=0){%> --%>
<%-- 										<%= prop.get(GCConstants.MSG_USR_PAYMENT_INVOICE_IDS_SEP) %> --%>
<%-- 									<%} %> --%>
<%-- 									<% forCounter++; %> --%>
<%-- 									<%=i %> --%>
<%-- 								<%} %> --%>
<%-- 							<%} %> --%>
<!-- 						</td> -->
<%-- 						<td><%= invoice.getTotal() %></td> --%>
<!-- 					</tr> -->
<%-- 					<% customerBalance=customerBalance.add(new BigDecimal(invoice.getTotal())); %> --%>
<%-- 					<% currency=invoice.getCurrencyId(); %> --%>
<%-- 				<%} %> --%>
<!-- 					<tr> -->
<!-- 						<td style="border: 0" colspan="6"></td> -->
<%-- 						<td style="border: 0; text-align: center;font-weight: bold;"><%=prop.get(GCConstants.MSG_REPORTS_INVOICES_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+currency, null) %></td> --%>
<%-- 						<td style="font-weight: bold;"><%=customerBalance.toString() %></td> --%>
<!-- 					</tr> -->
<!-- 				</table> -->
<%-- 			<%} %> --%>
<!-- 		</div> -->
<!-- 	</body> -->
<!-- </html> -->

