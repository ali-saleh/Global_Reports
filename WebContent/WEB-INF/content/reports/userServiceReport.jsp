<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="%{reportUser != null}">

	<div id="page_title">
		<s:text name="report.user.title" />
		&nbsp;
		<s:property value="reportUser.fullname" escapeHtml="false" />
	</div>

	<fieldset>
		<legend>
			<s:text name="report.user.info" />
		</legend>
		<div class="report_info">
			<div class="userinfo">
				<s:text name="report.user.install.date" />
				<s:property value="reportUser.installationDate" />
			</div>

			<div class="seperator"></div>
			<div class="seperator"></div>
			<div style="clear: both;"></div>
		</div>
	</fieldset>
	<s:if test="%{serviceReport != null && serviceReport.size > 0}">
		Some result should appear
	</s:if>

</s:if>
<s:else>
	<p>No User was found</p>
</s:else>
