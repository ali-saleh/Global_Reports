<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="report_results_page balance_results_report">
	<div class="report_main_title">
		<s:text name="reports.invoice.reports.title"></s:text>

	</div>
	<div class="report_logo">
		<img alt="logo"
			src="${pageContext.request.contextPath}/resources/images/logobw.png">
	</div>
	<div style="clear: both;"></div>
	<div class="seperator"></div>
	<div class="seperator"></div>

	<div class="report_info">
		<div class="report_city">
			<s:if test="city != null">
				<s:property value="getText('report.city.one.city')"
					escapeHtml="false" />
				<s:property value="city" escapeHtml="false" />
				<br>
			</s:if>
			<s:else>
				<s:property value="getText('report.city.all.cities')"
					escapeHtml="false" />
			</s:else>
		</div>
		<div class="report_date">
			<div class="report_from_date">
				<s:if test="fromDate != null">
					<s:property value="getText('report.from.date')" escapeHtml="false" />
					<br>
				</s:if>
			</div>
			<div class="report_to_date">
				<s:if test="fromDate != null">
					<s:property value="getText('report.to.date')" escapeHtml="false" />
					<br>
				</s:if>
			</div>
			<div class="report_payway"></div>
		</div>
		<div class="seperator"></div>
		<div class="seperator"></div>
		<div style="clear: both;"></div>
	</div>
	<s:if test="%{invoicesDollar != null}">
		<s:set id="i" value="1" />

		<div class="report_title">
			<s:text name="report.invoice.name.dollar"></s:text>
		</div>
		<div style="clear: both;"></div>
		<table>
			<thead>
				<tr>
					<th style="width: 20px"><%="#"%></th>
					<th style="width: 40px"><s:text
							name="report.invoice.invoice.number" /></th>
					<th style="width: 90px"><s:text
							name="report.invoice.customer.number" /></th>
					<th style="width: 80px"><s:text
							name="report.invoice.customer.name" /></th>
					<th style="width: 60px"><s:text
							name="report.invoice.invoice.date" /></th>
					<th style="width: 100px"><s:text
							name="report.invoice.invoice.status" /></th>
					<th style="width: 100px"><s:text
							name="report.invoice.customer.balance" /><br /> <s:text
							name="currency3.1" /></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="invoicesDollar" var="invoice">
					<tr>
						<td>${i}</td>
						<td>
						<s:property value="#invoice.invoiceId"/>
<%-- 						<td><s:text name="#invoice.userFullName" /></td> --%>
						<td><s:property value="#invoice.userFullName"
								escapeHtml="false" /></td>
						<td><s:property value="#invoice.createDate" /></td>
						<td>Status</td>
<%-- 						<td><s:text name="invoice.status.#{invoice.status}" /></td> --%>
						<td>Payments</td>
						<td><s:property value="#invoice.total" /></td>
					</tr>
					<s:set id="i" value="#i+1" />
				</s:iterator>
			</tbody>
		</table>
		<div style="clear: both;"></div>

	</s:if>
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
</div>
