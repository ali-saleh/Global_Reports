<%@ taglib prefix="s" uri="/struts-tags"%>

<table class="report_table" id="example">
	<thead>
		<tr>
			<th>Name (Property)</th>
			<th>Price (Property)</th>
			<th>Code (Property)</th>
			<th>Desc (Property)</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="items" var="item">
			<tr>
				<td><s:property value="#item.internal_number" /></td>
				<td><s:property value="#item.price" escapeHtml="false" /></td>
				<td><s:property value="#item.code" /></td>
				<td><s:property value="#item.desc" escapeHtml="false" /></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
