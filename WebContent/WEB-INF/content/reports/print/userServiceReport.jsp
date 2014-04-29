<%@ taglib prefix="s" uri="/struts-tags"%>


<div class="report_results_page balance_results_report">
	<div class="report_main_title">
		<s:text name="report.user.title" />
	</div>
	<div class="report_logo">
		<img alt="logo"
			src="${pageContext.request.contextPath}/resources/images/logobw.png">
	</div>
	<div style="clear: both;"></div>
	<div class="seperator"></div>
	<div class="seperator"></div>

	<div class="report_info">
		<div class="user_field">
			<s:text name="reports.customer" />
		</div>
		
		<s:if test="%{reportUser != null}">
			<div class="userinfo">
				<s:text name="report.user.install.date" />
				<s:property value="user.installationDate"/>
			</div>
		</s:if>
		
		<div class="seperator"></div>
		<div class="seperator"></div>
		<div style="clear: both;"></div>
	</div>

	<s:if test="%{itemsReportDollar != null && itemsReportDollar.size > 0}">

	</s:if>
</div>