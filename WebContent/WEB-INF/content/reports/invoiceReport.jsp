<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="page_title">
	<h1>
		<s:property value="getText('reports.invoice.reports.title')"
			escapeHtml="false" />
	</h1>
</div>

<div id="filter_fields">
	<s:if test="city != null">
		<s:textfield label="city" name="city" readonly="true" />
		<br>
	</s:if>
	<s:if test="currency != null">
		<s:textfield label="currency" name="curruncy" readonly="true" />
		<br>
	</s:if>
	<s:if test="fromDate != null">
		<s:textfield label="Start Date" name="fromDate" readonly="true" />
		<br>
	</s:if>

	<s:if test="fromDate != null">
		<s:textfield label="End Date" name="toDate" readonly="true" />
		<br>
	</s:if>

<%-- 	<s:if test="vatSelect"> --%>
<!-- 		with -->
<%-- 	</s:if> --%>
<%-- 	<s:else> --%>
<!-- 		without -->
<%-- 	</s:else> --%>
	<br>
</div>

<div id="invoice_res" class="result_table">
	<table class="report_table" style="display:none;">
		<thead>
			<tr>
				<th><s:property value="getText('order.create.fullname')"
						escapeHtml="false" /></th>
				<th><s:property value="getText('invoices.invoice.id')"
						escapeHtml="false" /></th>
				<th><s:property value="getText('invoices.invoice.list.date')"
						escapeHtml="false" /></th>
				<th><s:property value="getText('invoices.invoice.list.amount')"
						escapeHtml="false" /></th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="invoices" var="item">
				<tr>
					<td><s:property value="#item.userFullName" escapeHtml="false" /></td>
					<td><s:property value="#item.invoiceId" /></td>
					<td><s:property value="#item.createDate" /></td>
					<td><s:property value="#item.total" /></td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
</div>
