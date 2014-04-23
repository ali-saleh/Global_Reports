<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<s:set var="title">
	<tiles:getAsString name="title" ignore="true" />
</s:set>
<title><s:text name="%{#title}" /></title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reports.css" />
</head>

<body>
	<tiles:insertAttribute name="body" />
</body>
</html>