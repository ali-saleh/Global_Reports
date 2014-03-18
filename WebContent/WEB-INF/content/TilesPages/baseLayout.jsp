<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head dir="ltr">
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">

<%-- <title><%= (String)request.getAttribute("page_title") %></title> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/globalcom.css" />
<link rel="stylesheet" media="screen" type="text/css"
	href="${pageContext.request.contextPath}/resources/libraries/date/date_input.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/libraries/dataTable/jquery.dataTables.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/libraries/date/date_methods.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/libraries/date/jquery.date_input.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/libraries/mask/mask.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/globalcom.js"></script>
<title>Item Report (See if this appears ??)</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/libraries/dataTable/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/test.js"></script>
</head>

<body dir="rtl">

	<div id="header">
		<tiles:insertAttribute name="header" />
		<br />
	</div>
	<div id="wrapper">
		<tiles:insertAttribute name="menu" />
		<br />
		<tiles:insertAttribute name="body" />
		<br />
	</div>
	<hr />
	<div id="footer">
		<tiles:insertAttribute name="footer" />
		<br />
	</div>
</body>
</html>