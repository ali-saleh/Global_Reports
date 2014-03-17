<%@ taglib prefix="s" uri="/struts-tags"%>

<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<link rel="stylesheet" type="text/css"
	href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
<title>Hello World</title>
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="./pages/js/test.js"></script>
</head>
<body>
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
</body>