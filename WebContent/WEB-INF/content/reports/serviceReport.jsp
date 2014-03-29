<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="page_title">
	<s:property value="getText('reports.service.reports.title')"
		escapeHtml="false" />
</div>

<div id="filter_fields">
	<s:if test="city != null">
		<s:textfield label="city" name="city" readonly="true" />
		<br>
	</s:if>
	<s:if test="itemName != null">
		<s:textfield label="itemName" name="itemName" readonly="true" />
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
</div>

<div id="service_res" class="result_table">
	<table class="report_table">
		<thead>
			<tr>
				<th><s:property value="getText('service.service.number')"
						escapeHtml="false" /></th>
				<th><s:property value="getText('service.service.name')"
						escapeHtml="false" /></th>
				<th><s:property value="getText('service.service.quantity')"
						escapeHtml="false" /></th>
				<th><s:property value="getText('service.service.amount')"
						escapeHtml="false" /></th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="services" var="service">
				<tr>
					<td><s:property value="#service.itemId" /></td>
					<td><s:property value="#service.itemDescription" escapeHtml="false" /></td>
					<td><s:property value="#service.orderCount" /></td>
					<td><s:property value="#service.amount" /></td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
</div>

