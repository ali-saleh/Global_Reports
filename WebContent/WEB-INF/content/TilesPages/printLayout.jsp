<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head dir="ltr">
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">

<tiles:insertAttribute name="title"/>

</head>

<body dir="rtl">

	<div id="header">
		<tiles:insertAttribute name="header" />
		<br />
	</div>
	<div id="wrapper">
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