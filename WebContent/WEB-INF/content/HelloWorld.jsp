<%@ taglib prefix="s" uri="/struts-tags"%>

Hello World,
<s:property value="name" />
<table id="example">
	<thead>
		<tr>
			<th>Name</th>
			<th>Price</th>
			<th>Code</th>
			<th>Desc</th>
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