<%@ taglib prefix="s" uri="/struts-tags"%>

<table id="example">
	<thead>
		<tr>
			<th>User ID (Property)</th>
			<th>Invoice ID (Property)</th>
			<th>User Name (Property)</th>
			<th>create_datetime (Property)</th>
			<th>balance (Property)</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="invoices" var="item">
			<tr>
				<td><s:property value="#item.user_id" /></td>
				<td><s:property value="#item.invoice_id" /></td>
				<td><s:property value="#item.disply_name" escapeHtml="false" /></td>
				<td><s:property value="#item.create_datetime" /></td>
				<td><s:property value="#item.balance" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
