<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="report_info">
	<div class="report_city">
		<s:if test="city != null">
			<s:property value="getText('report.city.one.city')"
				escapeHtml="false" />
			<s:property value="city" escapeHtml="false" />
			<br>
		</s:if>
		<s:else>
			<s:property value="getText('report.city.all.cities')"
				escapeHtml="false" />
		</s:else>
	</div>
	<div class="report_date">
		<div class="report_from_date">
			<s:if test="fromDate != null">
				<s:property value="getText('report.from.date')" escapeHtml="false" />
				<br>
			</s:if>
		</div>
		<div class="report_to_date">
			<s:if test="fromDate != null">
				<s:property value="getText('report.to.date')" escapeHtml="false" />
				<br>
			</s:if>
		</div>
		<div class="report_payway"></div>
	</div>
	<div class="seperator"></div>
	<div class="seperator"></div>
</div>
