<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/print.css" />
</head>

<body dir="rtl">
	<div class="report_results_page balance_results_report">
		<div class="report_main_title">
			<tiles:insertAttribute name="title" />
		</div>
		<div class="report_logo">
			<img alt="logo"
				src="${pageContext.request.contextPath}/resources/images/logobw.png">
		</div>
		<div style="clear: both;"></div>
		<div class="seperator"></div>
		<div class="seperator"></div>

		<tiles:insertAttribute name="body" />
	</div>
</body>
</html>