<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="report_results_page balance_results_report">
	<div class="report_main_title">
		<s:text name="report.item.title" />
	</div>
	<div class="report_logo">
		<img alt="logo"
			src="${pageContext.request.contextPath}/resources/images/logobw.png">
	</div>
	<div style="clear: both;"></div>
	<div class="seperator"></div>
	<div class="seperator"></div>

	<div class="report_info">
		<div class="report_city">
			<s:if test="%{selectedCity != 0}">
				<s:text name="report.city.one.city" />
				<s:property value="city" escapeHtml="false" />
				<br>
			</s:if>
			<s:else>
				<s:text name="report.city.all.cities" />
			</s:else>
		</div>
		<div class="report_date">
			<div class="report_from_date">
				<s:if test="%{fromDate != null}">
					<s:text name="report.from.date" />
					<s:property value="fromDate" />
				</s:if>
			</div>
			<div class="report_to_date">
				<s:if test="%{toDate != null}">
					<s:text name="report.to.date" />
					<s:property value="toDate" />
				</s:if>
			</div>
		</div>
		<div class="report_payway">
			<s:if test="%{itemNames != null && itemNames.size > 0}">
				<s:text name="reports.item" />:&nbsp;
				<s:set id="i" value="0" />
				<s:iterator value="itemNames" var="item">
					<option value="${i}">
						<s:property value="#item" escapeHtml="false" />
					</option>
					<br />
					<s:set id="i" value="#i+1" />
				</s:iterator>
			</s:if>
			<s:else>
				<s:text name="reports.allitems" />
			</s:else>
		</div>
		<div class="seperator"></div>
		<div class="seperator"></div>
		<div style="clear: both;"></div>
	</div>

	<s:if test="%{itemsReportDollar != null && itemsReportDollar.size > 0}">
	</s:if>
</div>