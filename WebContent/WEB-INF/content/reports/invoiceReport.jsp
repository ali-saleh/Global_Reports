<%@ taglib prefix="s" uri="/struts-tags"%>

<head>
<link rel="stylesheet" type="text/css"
	href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
<title>Item Report (See if this appears ??)</title>
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/test.js"></script>
</head>
<body>
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
</body>