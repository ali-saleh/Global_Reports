<%@page import="beans.GCCheque"%>
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
List<GCPayment> paymentsDollarDeletedCash = (List<GCPayment>)request.getAttribute(GCConstants.FLD_REPORTS_PAYMENT_DOLLAR_DELETED_CASH);
List<GCPayment> paymentsDollarCash = (List<GCPayment>)request.getAttribute(GCConstants.FLD_REPORTS_PAYMENT_DOLLAR_CASH);
List<GCPayment> paymentsShekelDeletedCash = (List<GCPayment>)request.getAttribute(GCConstants.FLD_REPORTS_PAYMENT_SHEKEL_DELETED_CASH);
List<GCPayment> paymentsShekelCash = (List<GCPayment>)request.getAttribute(GCConstants.FLD_REPORTS_PAYMENT_SHEKEL_CASH);
List<GCPayment> paymentsDollarDeletedCheque = (List<GCPayment>)request.getAttribute(GCConstants.FLD_REPORTS_PAYMENT_DOLLAR_DELETED_CHEQUE);
List<GCPayment> paymentsDollarCheque = (List<GCPayment>)request.getAttribute(GCConstants.FLD_REPORTS_PAYMENT_DOLLAR_CHEQUE);
List<GCPayment> paymentsShekelDeletedCheque = (List<GCPayment>)request.getAttribute(GCConstants.FLD_REPORTS_PAYMENT_SHEKEL_DELETED_CHEQUE);
List<GCPayment> paymentsShekelCheque = (List<GCPayment>)request.getAttribute(GCConstants.FLD_REPORTS_PAYMENT_SHEKEL_CHEQUE);

String cityIDString = (String)request.getAttribute(GCConstants.FLD_USR_CITY);
String fromDateString = (String)request.getAttribute(GCConstants.FLD_REPORTS_DATE_FROM);
String toDateString = (String)request.getAttribute(GCConstants.FLD_REPORTS_DATE_TO);
String paywayString = (String)request.getAttribute(GCConstants.FLD_REPORTS_PAYWAY);
int payway = Integer.parseInt(paywayString);

BigDecimal customerBalance = BigDecimal.ZERO;
int currency =0;
int number=1;
int forCounter =0;
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
			<%= prop.get(GCConstants.MSG_REPORTS_PAYMENT_REPORT_TITLE, null) %>
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
				<%= prop.get(GCConstants.MSG_REPORTS_PAYWAY, null)+": " %>
				<% if(payway == 1){ %>
					<%= prop.get(GCConstants.MSG_REPORTS_CHEQUE) %>
				<%}else if(payway == 10){ %>
					<%= prop.get(GCConstants.MSG_REPORTS_CASH) %>
				<%}else{ %>
					<%= prop.get(GCConstants.MSG_REPORTS_BOTH) %>
				<%} %>
			</div>
		</div>
		<div class="seperator"></div>
		<div class="seperator"></div>
			<% if(paymentsDollarCash!=null && !paymentsDollarCash.isEmpty()){ %>
			<% number=1; %>
			<% customerBalance = BigDecimal.ZERO; %>
			<div class="report_title">
				<%= prop.get(GCConstants.MSG_REPORTS_PAYMENT_NAME_DOLLAR_CASH, null) %>
			</div>
			<div style="clear: both;"></div>
				<table>
					<tr>
						<th style="width: 20px"><%= "#" %></th>
						<th style="width: 40px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENT_NUMBER) %></th>
						<th style="width: 90px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_CUSTOMER_NUMBER) %></th>
						<th style="width: 130px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_CUSTOMER_NAME) %></th>
						<th style="width: 80px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENTS_DATE) %></th>
						<th style="width: 100px;"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENTS_INVOICES) %></th>
						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_AMOUNT)+"<br /> "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"1", null)  %></th>
					</tr>
				<% for(GCPayment payment : paymentsDollarCash){ %>
					<tr>
						<td style="text-align: center;"><%= number++ %></td>
						<td><%= payment.getPaymentID() %></td>
						<td><%= payment.getCustomerNumber() %></td>
						<td><%= payment.getCustomerFullname() %></td>
						<td><%= JBillingSrvImp.DF.format(payment.getPaymentDate()) %></td>
						<td>
							<%if(payment.getInvoiceIds()!=null){ %>
								<% forCounter=0; %>
								<%for(int i : payment.getInvoiceIds()){ %>
									<% if(forCounter!=0){ %>
										<%= prop.get(GCConstants.MSG_USR_PAYMENT_INVOICE_IDS_SEP, null) %>
									<%} %>
									<% forCounter++; %>
									<%=i %>
								<%} %>
							<%} %>
						</td>
						<td><%= payment.getAmount()%></td>
					</tr>
					<% customerBalance=customerBalance.add(new BigDecimal(payment.getAmount())); %>
					<% currency=payment.getCurrencyId(); %>
				<%} %>
					<tr>
						<td style="border: 0" colspan="5"></td>
						<td style="border: 0; text-align: center;font-weight: bold;"><%=prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+currency, null) %></td>
						<td style="font-weight: bold"><%=customerBalance.toString() %></td>
					</tr>
				</table>
			<%} %>
			<% if(paymentsDollarCheque!=null && !paymentsDollarCheque.isEmpty()){ %>
			<% number=1; %>
			<% customerBalance = BigDecimal.ZERO; %>
			<div class="report_title">
				<%= prop.get(GCConstants.MSG_REPORTS_PAYMENT_NAME_DOLLAR_CHEQUE, null) %>
			</div>
			<div style="clear: both;"></div>
				<table>
					<tr>
						<th style="width: 20px"><%= "#" %></th>
						<th style="width: 40px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENT_NUMBER) %></th>
						<th style="width: 90px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_CUSTOMER_NUMBER) %></th>
						<th style="width: 130px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_CUSTOMER_NAME) %></th>
						<th style="width: 80px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENTS_DATE) %></th>
						<th style="width: 100px;"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENTS_INVOICES) %></th>
						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_AMOUNT)+"<br /> "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"1", null)  %></th>
					</tr>
				<% for(GCPayment payment : paymentsDollarCheque){ %>
					<tr>
						<td style="text-align: center;" rowspan="2"><%= number++ %></td>
						<td><%= payment.getPaymentID() %></td>
						<td><%= payment.getCustomerNumber() %></td>
						<td><%= payment.getCustomerFullname() %></td>
						<td><%= JBillingSrvImp.DF.format(payment.getPaymentDate()) %></td>
						<td>
							<%if(payment.getInvoiceIds()!=null){ %>
								<% forCounter=0; %>
								<%for(int i : payment.getInvoiceIds()){ %>
									<% if(forCounter!=0){ %>
										<%= prop.get(GCConstants.MSG_USR_PAYMENT_INVOICE_IDS_SEP, null) %>
									<%} %>
									<% forCounter++; %>
									<%=i %>
								<%} %>
							<%} %>
						</td>
						<td><%= payment.getAmount()%></td>
					</tr>
					<% customerBalance=customerBalance.add(new BigDecimal(payment.getAmount())); %>
					<% currency=payment.getCurrencyId(); %>
					<% GCCheque cheque = payment.getCheque(); %>
					<tr style="font-size: 9px; font-style: italic;">
						<td style="font-weight: bold;"><%=prop.get(GCConstants.MSG_CRTPAY_PAYMENT_CHEQUE_NUMBER, null) %></td>
						<td><%= cheque.getChequeNumber() %></td>
						<td style="font-weight: bold;"><%=prop.get(GCConstants.MSG_CRTPAY_PAYMENT_CHEQUE_BANK, null) %></td>
						<td><%= cheque.getBankName() %></td>
						<td style="font-weight: bold;"><%=prop.get(GCConstants.MSG_CRTPAY_PAYMENT_CHEQUE_DATE, null) %></td>
						<td><%= JBillingSrvImp.DF.format(cheque.getChequeDate()) %></td>
					</tr>		
				<%} %>
					<tr>
						<td style="border: 0" colspan="5"></td>
						<td style="border: 0; text-align: center;font-weight: bold;"><%=prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+currency, null) %></td>
						<td style="font-weight: bold"><%=customerBalance.toString() %></td>
					</tr>
				</table>
			<%} %>
			<% if(paymentsShekelCash!=null && !paymentsShekelCash.isEmpty()){ %>
			<% number=1; %>
			<% customerBalance = BigDecimal.ZERO; %>
			<div class="report_title">
				<%= prop.get(GCConstants.MSG_REPORTS_PAYMENT_NAME_SHEKEL_CASH) %>
			</div>
			<div style="clear: both;"></div>
				<table>
					<tr>
						<th style="width: 20px"><%= "#" %></th>
						<th style="width: 40px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENT_NUMBER) %></th>
						<th style="width: 90px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_CUSTOMER_NUMBER) %></th>
						<th style="width: 130px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_CUSTOMER_NAME) %></th>
						<th style="width: 80px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENTS_DATE) %></th>
						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENTS_INVOICES) %></th>
						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_AMOUNT)+"<br /> "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"12", null) %></th>
					</tr>
				<% for(GCPayment payment : paymentsShekelCash){ %>
					<tr>
						<td style="text-align: center;"><%= number++ %></td>
						<td><%= payment.getPaymentID() %></td>
						<td><%= payment.getCustomerNumber() %></td>
						<td><%= payment.getCustomerFullname() %></td>
						<td><%= JBillingSrvImp.DF.format(payment.getPaymentDate()) %></td>
						<td>
							<%if(payment.getInvoiceIds()!=null){ %>
								<% forCounter=0; %>
								<%for(int i : payment.getInvoiceIds()){ %>
									<% if(forCounter!=0){ %>
										<%= prop.get(GCConstants.MSG_USR_PAYMENT_INVOICE_IDS_SEP, null) %>
									<%} %>
									<% forCounter++; %>
									<%=i %>
								<%} %>
							<%} %>
						</td>
						<td><%= payment.getAmount() %></td>
					</tr>
					<% customerBalance=customerBalance.add(new BigDecimal(payment.getAmount())); %>
					<% currency=payment.getCurrencyId(); %>			
					<%} %>
					<tr>
						<td style="border: 0" colspan="5"></td>
						<td style="border: 0; text-align: center;font-weight: bold;"><%=prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+currency, null) %></td>
						<td style="font-weight: bold"><%=customerBalance.toString() %></td>
					</tr>
				</table>
			<%} %>
			
			<% if(paymentsShekelCheque!=null && !paymentsShekelCheque.isEmpty()){ %>
			<% number=1; %>
			<% customerBalance = BigDecimal.ZERO; %>
			<div class="report_title">
				<%= prop.get(GCConstants.MSG_REPORTS_PAYMENT_NAME_SHEKEL_CHEQUE) %>
			</div>
			<div style="clear: both;"></div>
				<table>
					<tr>
						<th style="width: 20px"><%= "#" %></th>
						<th style="width: 40px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENT_NUMBER) %></th>
						<th style="width: 90px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_CUSTOMER_NUMBER) %></th>
						<th style="width: 130px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_CUSTOMER_NAME) %></th>
						<th style="width: 80px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENTS_DATE) %></th>
						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENTS_INVOICES) %></th>
						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_AMOUNT)+"<br /> "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"12", null) %></th>
					</tr>
				<% for(GCPayment payment : paymentsShekelCheque){ %>
					<tr>
						<td style="text-align: center;" rowspan="2"><%= number++ %></td>
						<td><%= payment.getPaymentID() %></td>
						<td><%= payment.getCustomerNumber() %></td>
						<td><%= payment.getCustomerFullname() %></td>
						<td><%= JBillingSrvImp.DF.format(payment.getPaymentDate()) %></td>
						<td>
							<%if(payment.getInvoiceIds()!=null){ %>
								<% forCounter=0; %>
								<%for(int i : payment.getInvoiceIds()){ %>
									<% if(forCounter!=0){ %>
										<%= prop.get(GCConstants.MSG_USR_PAYMENT_INVOICE_IDS_SEP, null) %>
									<%} %>
									<% forCounter++; %>
									<%=i %>
								<%} %>
							<%} %>
						</td>
						<td><%= payment.getAmount() %></td>
					</tr>
					<% customerBalance=customerBalance.add(new BigDecimal(payment.getAmount())); %>
					<% currency=payment.getCurrencyId(); %>	
					<% GCCheque cheque = payment.getCheque(); %>
					<tr style="font-size: 9px; font-style: italic;">
						<td style="font-weight: bold;"><%=prop.get(GCConstants.MSG_CRTPAY_PAYMENT_CHEQUE_NUMBER, null) %></td>
						<td><%= cheque.getChequeNumber() %></td>
						<td style="font-weight: bold;"><%=prop.get(GCConstants.MSG_CRTPAY_PAYMENT_CHEQUE_BANK, null) %></td>
						<td><%= cheque.getBankName() %></td>
						<td style="font-weight: bold;"><%=prop.get(GCConstants.MSG_CRTPAY_PAYMENT_CHEQUE_DATE, null) %></td>
						<td><%= JBillingSrvImp.DF.format(cheque.getChequeDate()) %></td>
					</tr>		
					<%} %>
					<tr>
						<td style="border: 0" colspan="5"></td>
						<td style="border: 0; text-align: center;font-weight: bold;"><%=prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+currency, null) %></td>
						<td style="font-weight: bold"><%=customerBalance.toString() %></td>
					</tr>
				</table>
			<%} %>
			
			
			
			
			
			
			<% if(paymentsDollarDeletedCash!=null && !paymentsDollarDeletedCash.isEmpty()){ %>
			<% number=1; %>
			<% customerBalance = BigDecimal.ZERO; %>
			<div class="report_title">
				<%= prop.get(GCConstants.MSG_REPORTS_PAYMENT_NAME_DOLLAR_CASH)+" "+prop.get(GCConstants.MSG_REPORTS_DELETED, null)  %>
			</div>
			<div style="clear: both;"></div>
				<table>
					<tr>
						<th style="width: 20px"><%= "#" %></th>
						<th style="width: 40px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENT_NUMBER) %></th>
						<th style="width: 90px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_CUSTOMER_NUMBER) %></th>
						<th style="width: 130px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_CUSTOMER_NAME) %></th>
						<th style="width: 80px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENTS_DATE) %></th>
						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENTS_INVOICES) %></th>
						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_AMOUNT)+"<br /> "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"1", null) %></th>
					</tr>
				<% for(GCPayment payment : paymentsDollarDeletedCash){ %>
					<tr>
						<td style="text-align: center;"><%= number++ %></td>
						<td><%= payment.getPaymentID() %></td>
						<td><%= payment.getCustomerNumber() %></td>
						<td><%= payment.getCustomerFullname() %></td>
						<td><%= JBillingSrvImp.DF.format(payment.getPaymentDate()) %></td>
						<td>
							<%if(payment.getInvoiceIds()!=null){ %>
								<% forCounter=0; %>
<!--								<%for(int i : payment.getInvoiceIds()){ %>-->
<!--									<% if(forCounter!=0){ %>-->
										<%= prop.get(GCConstants.MSG_USR_PAYMENT_INVOICE_IDS_SEP, null) %>
									<%} %>
									<% forCounter++; %>
									<%=i %>
								<%} %>
							<%} %>
						</td>
						<td><%= payment.getAmount() %></td>
					</tr>
					<% customerBalance=customerBalance.add(new BigDecimal(payment.getAmount())); %>
					<% currency=payment.getCurrencyId(); %>
				<%} %>
					<tr>
						<td style="border: 0" colspan="5"></td>
						<td style="border: 0; text-align: center;font-weight: bold;"><%=prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+currency, null) %></td>
						<td><%=customerBalance.toString() %></td>
					</tr>
				</table>
			<%} %>
			<% if(paymentsDollarDeletedCheque!=null && !paymentsDollarDeletedCheque.isEmpty()){ %>
			<% number=1; %>
			<% customerBalance = BigDecimal.ZERO; %>
			<div class="report_title">
				<%= prop.get(GCConstants.MSG_REPORTS_PAYMENT_NAME_DOLLAR_CHEQUE)+" "+prop.get(GCConstants.MSG_REPORTS_DELETED, null) %>
			</div>
			<div style="clear: both;"></div>
				<table>
					<tr>
						<th style="width: 20px"><%= "#" %></th>
						<th style="width: 40px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENT_NUMBER) %></th>
						<th style="width: 90px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_CUSTOMER_NUMBER) %></th>
						<th style="width: 130px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_CUSTOMER_NAME) %></th>
						<th style="width: 80px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENTS_DATE) %></th>
						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENTS_INVOICES) %></th>
						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_AMOUNT)+"<br /> "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"1", null) %></th>
					</tr>
				<% for(GCPayment payment : paymentsDollarDeletedCheque){ %>
					<tr>
						<td style="text-align: center;" rowspan="2"><%= number++ %></td>
						<td><%= payment.getPaymentID() %></td>
						<td><%= payment.getCustomerNumber() %></td>
						<td><%= payment.getCustomerFullname() %></td>
						<td><%= JBillingSrvImp.DF.format(payment.getPaymentDate()) %></td>
						<td>
							<%if(payment.getInvoiceIds()!=null){ %>
								<% forCounter=0; %>
								<%for(int i : payment.getInvoiceIds()){ %>
									<% if(forCounter!=0){ %>
										<%= prop.get(GCConstants.MSG_USR_PAYMENT_INVOICE_IDS_SEP, null) %>
									<%} %>
									<% forCounter++; %>
									<%=i %>
								<%} %>
							<%} %>
						</td>
						<td><%= payment.getAmount() %></td>
					</tr>
					<% customerBalance=customerBalance.add(new BigDecimal(payment.getAmount())); %>
					<% currency=payment.getCurrencyId(); %>
					<% GCCheque cheque = payment.getCheque(); %>
					<tr style="font-size: 9px; font-style: italic;">
						<td style="font-weight: bold;"><%=prop.get(GCConstants.MSG_CRTPAY_PAYMENT_CHEQUE_NUMBER, null) %></td>
						<td><%= cheque.getChequeNumber() %></td>
						<td style="font-weight: bold;"><%=prop.get(GCConstants.MSG_CRTPAY_PAYMENT_CHEQUE_BANK, null) %></td>
						<td><%= cheque.getBankName() %></td>
						<td style="font-weight: bold;"><%=prop.get(GCConstants.MSG_CRTPAY_PAYMENT_CHEQUE_DATE, null) %></td>
						<td><%= JBillingSrvImp.DF.format(cheque.getChequeDate()) %></td>
					</tr>		
				<%} %>
					<tr>
						<td style="border: 0" colspan="5"></td>
						<td style="border: 0; text-align: center;font-weight: bold;"><%=prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+currency, null) %></td>
						<td><%=customerBalance.toString() %></td>
					</tr>
				</table>
			<%} %>
			
			<% if(paymentsShekelDeletedCash!=null && !paymentsShekelDeletedCash.isEmpty()){ %>
			<% number=1; %>
			<% customerBalance = BigDecimal.ZERO; %>
			<div class="report_title">
				<%= prop.get(GCConstants.MSG_REPORTS_PAYMENT_NAME_SHEKEL_CASH)+" "+prop.get(GCConstants.MSG_REPORTS_DELETED, null) %>
			</div>
			<div style="clear: both;"></div>
				<table>
					<tr>
						<th style="width: 20px"><%= "#" %></th>
						<th style="width: 40px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENT_NUMBER) %></th>
						<th style="width: 90px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_CUSTOMER_NUMBER) %></th>
						<th style="width: 130px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_CUSTOMER_NAME) %></th>
						<th style="width: 80px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENTS_DATE) %></th>
						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENTS_INVOICES) %></th>
						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_AMOUNT)+"<br /> "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"12", null) %></th>
					</tr>
				<% for(GCPayment payment : paymentsShekelDeletedCash){ %>
					<tr>
						<td style="text-align: center;"><%= number++ %></td>
						<td><%= payment.getPaymentID() %></td>
						<td><%= payment.getCustomerNumber() %></td>
						<td><%= payment.getCustomerFullname() %></td>
						<td><%= JBillingSrvImp.DF.format(payment.getPaymentDate()) %></td>
						<td>
							<%if(payment.getInvoiceIds()!=null){ %>
								<% forCounter=0; %>
								<%for(int i : payment.getInvoiceIds()){ %>
									<% if(forCounter!=0){ %>
										<%= prop.get(GCConstants.MSG_USR_PAYMENT_INVOICE_IDS_SEP, null) %>
									<%} %>
									<% forCounter++; %>
									<%=i %>
								<%} %>
							<%} %>
						</td>
						<td><%= payment.getAmount()%></td>
					</tr>
					<% customerBalance=customerBalance.add(new BigDecimal(payment.getAmount())); %>
					<% currency=payment.getCurrencyId(); %>
				<%} %>
					<tr>
						<td style="border: 0" colspan="5"></td>
						<td style="border: 0; text-align: center;font-weight: bold;"><%=prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+currency, null) %></td>
						<td><%=customerBalance.toString() %></td>
					</tr>
				</table>
			<%} %>
			<% if(paymentsShekelDeletedCheque!=null && !paymentsShekelDeletedCheque.isEmpty()){ %>
			<% number=1; %>
			<% customerBalance = BigDecimal.ZERO; %>
			<div class="report_title">
				<%= prop.get(GCConstants.MSG_REPORTS_PAYMENT_NAME_SHEKEL_CHEQUE)+" "+prop.get(GCConstants.MSG_REPORTS_DELETED, null) %>
			</div>
			<div style="clear: both;"></div>
				<table>
					<tr>
						<th style="width: 20px"><%= "#" %></th>
						<th style="width: 40px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENT_NUMBER) %></th>
						<th style="width: 90px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_CUSTOMER_NUMBER) %></th>
						<th style="width: 130px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_CUSTOMER_NAME) %></th>
						<th style="width: 80px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENTS_DATE) %></th>
						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_PAYMENTS_INVOICES) %></th>
						<th style="width: 100px"><%= prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_AMOUNT)+"<br /> "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+"12", null) %></th>
					</tr>
				<% for(GCPayment payment : paymentsShekelDeletedCheque){ %>
					<tr>
						<td style="text-align: center;" rowspan="2"><%= number++ %></td>
						<td><%= payment.getPaymentID() %></td>
						<td><%= payment.getCustomerNumber() %></td>
						<td><%= payment.getCustomerFullname() %></td>
						<td><%= JBillingSrvImp.DF.format(payment.getPaymentDate()) %></td>
						<td>
							<%if(payment.getInvoiceIds()!=null){ %>
								<% forCounter=0; %>
								<%for(int i : payment.getInvoiceIds()){ %>
									<% if(forCounter!=0){ %>
										<%= prop.get(GCConstants.MSG_USR_PAYMENT_INVOICE_IDS_SEP, null) %>
									<%} %>
									<% forCounter++; %>
									<%=i %>
								<%} %>
							<%} %>
						</td>
						<td><%= payment.getAmount()%></td>
					</tr>
					<% customerBalance=customerBalance.add(new BigDecimal(payment.getAmount())); %>
					<% currency=payment.getCurrencyId(); %>
					<% GCCheque cheque = payment.getCheque(); %>
					<tr style="font-size: 9px; font-style: italic;">
						<td style="font-weight: bold;"><%=prop.get(GCConstants.MSG_CRTPAY_PAYMENT_CHEQUE_NUMBER, null) %></td>
						<td><%= cheque.getChequeNumber() %></td>
						<td style="font-weight: bold;"><%=prop.get(GCConstants.MSG_CRTPAY_PAYMENT_CHEQUE_BANK, null) %></td>
						<td><%= cheque.getBankName() %></td>
						<td style="font-weight: bold;"><%=prop.get(GCConstants.MSG_CRTPAY_PAYMENT_CHEQUE_DATE, null) %></td>
						<td><%= JBillingSrvImp.DF.format(cheque.getChequeDate()) %></td>
					</tr>		
				<%} %>
					<tr>
						<td style="border: 0" colspan="5"></td>
						<td style="border: 0; text-align: center;font-weight: bold;"><%=prop.get(GCConstants.MSG_REPORTS_PAYMENTS_REPORT_SUM)+" "+prop.get(GCConstants.PROP_CURRENCY_PREFIX3+currency, null) %></td>
						<td><%=customerBalance.toString() %></td>
					</tr>
				</table>
			<%} %>
		</div>
	</body>
</html>