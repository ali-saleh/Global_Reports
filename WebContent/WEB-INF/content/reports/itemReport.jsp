<%@ taglib prefix="s" uri="/struts-tags"%>

<head>
<link rel="stylesheet" type="text/css"
	href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
<title>Item Report (See if this appears ??)</title>
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/test.js"></script>
</head>
<body>
	<table id="example">
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
</body>