<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head dir="ltr">
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">

<s:set var="title">
  <tiles:getAsString name="title" ignore="true"/>
</s:set>
<title><s:text name="%{#title}"/></title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/accordion.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/globalcom.css" />
<link rel="stylesheet" media="screen" type="text/css"
	href="${pageContext.request.contextPath}/resources/libraries/date/date_input.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/libraries/dataTable/jquery.dataTables.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/libraries/jQueryUI/jquery-ui-1.10.4.custom.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/libraries/chosen/chosen.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/libraries/date/date_methods.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/libraries/date/jquery.date_input.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/libraries/mask/mask.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/globalcom.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/accordion.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/libraries/dataTable/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/libraries/jQueryUI/jquery-ui-1.10.4.custom.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/test.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/libraries/chosen/chosen.jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/libraries/chosen/chosen.proto.min.js"></script>
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