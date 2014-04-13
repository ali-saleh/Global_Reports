<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="report_results_page balance_results_report">
	<div class="report_main_title">
		<s:text name="report.balance.title" />
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
		<div class="report_currency"></div>
		<div class="seperator"></div>
		<div class="seperator"></div>
		<div style="clear: both;"></div>
		<div style="clear: both;"></div>
	</div>

	<s:if test="%{outstandingDollar != null && outstandingDollar.size > 0}">
		<s:set id="i" value="1" />

		<div class="report_title">
			<s:text name="report.balance.name.dollar" />
		</div>
		<div style="clear: both;"></div>
		<table>
			<thead>
				<tr>
					<th style="width: 50px"><%="#"%></th>
					<th style="width: 100px"><s:text
							name="report.balance.customer.number" /></th>
					<th style="width: 200px"><s:text
							name="report.balance.customer.name" /></th>
					<th style="width: 100px"><s:text
							name="report.balance.customer.city" /></th>
					<th style="width: 150px"><s:text
							name="report.balance.customer.balance" /><br /> <s:text
							name="currency3.1" /></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="outstandingDollar" var="record">
					<tr>
						<td style="text-align: center;">${i}</td>
						<td><s:property value="#record.id" /> <%-- 						<td><s:property value="#record.userNumber" --%>
							<%-- 								escapeHtml="false" /> --%>
						<td><s:property value="#record.fullname" escapeHtml="false" /></td>
						<s:set id="tmp" value="%{'city.'+#record.city}" />
						<td><s:text name="%{tmp}" /></td>

						<td><s:property value="#record.balance" /></td>
					</tr>
					<s:set id="i" value="#i+1" />
				</s:iterator>
				<tr>
					<td style="border: 0" colspan="3"></td>
					<td style="border: 0; text-align: center; font-weight: bold;"><s:text
							name="report.balance.customer.sum" />&nbsp; <s:text
							name="currency3.1" /></td>
					<td style="font-weight: bold;"><s:property
							value="outstandingDollarSum" /></td>
				</tr>
			</tbody>
		</table>
		<div style="clear: both;"></div>
	</s:if>

	<s:if test="%{outstandingShekel != null && outstandingShekel.size > 0}">
		<s:set id="i" value="1" />

		<div class="report_title">
			<s:text name="report.balance.name.shekel" />
		</div>
		<div style="clear: both;"></div>
		<table>
			<thead>
				<tr>
					<th style="width: 50px"><%="#"%></th>
					<th style="width: 100px"><s:text
							name="report.balance.customer.number" /></th>
					<th style="width: 200px"><s:text
							name="report.balance.customer.name" /></th>
					<th style="width: 100px"><s:text
							name="report.balance.customer.city" /></th>
					<th style="width: 150px"><s:text
							name="report.balance.customer.balance" /><br /> <s:text
							name="currency3.1" /></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="outstandingShekel" var="record">
					<tr>
						<td style="text-align: center;">${i}</td>
						<td><s:property value="#record.id" /> <%-- 						<td><s:property value="#record.userNumber" --%>
							<%-- 								escapeHtml="false" /> --%>
						<td><s:property value="#record.fullname" escapeHtml="false" /></td>
						<s:set id="tmp" value="%{'city.'+#record.city}" />
						<td><s:text name="%{tmp}" /></td>

						<td><s:property value="#record.balance" /></td>
					</tr>
					<s:set id="i" value="#i+1" />
				</s:iterator>
				<tr>
					<td style="border: 0" colspan="3"></td>
					<td style="border: 0; text-align: center; font-weight: bold;"><s:text
							name="report.balance.customer.sum" />&nbsp; <s:text
							name="currency3.12" /></td>
					<td style="font-weight: bold;"><s:property
							value="outstandingShekelSum" /></td>
				</tr>
			</tbody>
		</table>
		<div style="clear: both;"></div>
	</s:if>

	<s:if
		test="%{(outstandingDollarDeleted != null && outstandingDollarDeleted.size > 0) ||
		 (outstandingShekelDeleted != null && outstandingShekelDeleted.size > 0}">
		<div class="report_title">
			<s:text name="report.balance.name.deleted"></s:text>
			<div class="seperator"></div>
			<div style="clear: both;"></div>
		</div>

		<s:if
			test="%{outstandingDollarDeleted != null && outstandingDollarDeleted.size > 0}">
			<s:set id="i" value="1" />

			<div class="report_title">
				<s:text name="report.balance.name.dollar" />
			</div>
			<div style="clear: both;"></div>
			<table>
				<thead>
					<tr>
						<th style="width: 50px"><%="#"%></th>
						<th style="width: 100px"><s:text
								name="report.balance.customer.number" /></th>
						<th style="width: 200px"><s:text
								name="report.balance.customer.name" /></th>
						<th style="width: 100px"><s:text
								name="report.balance.customer.city" /></th>
						<th style="width: 150px"><s:text
								name="report.balance.customer.balance" /><br /> <s:text
								name="currency3.1" /></th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="outstandingDollarDeleted" var="record">
						<tr>
							<td style="text-align: center;">${i}</td>
							<td><s:property value="#record.id" /> <%-- 						<td><s:property value="#record.userNumber" --%>
								<%-- 								escapeHtml="false" /> --%>
							<td><s:property value="#record.fullname" escapeHtml="false" /></td>
							<s:set id="tmp" value="%{'city.'+#record.city}" />
							<td><s:text name="%{tmp}" /></td>

							<td><s:property value="#record.balance" /></td>
						</tr>
						<s:set id="i" value="#i+1" />
					</s:iterator>
					<tr>
						<td style="border: 0" colspan="3"></td>
						<td style="border: 0; text-align: center; font-weight: bold;"><s:text
								name="report.balance.customer.sum" />&nbsp; <s:text
								name="currency3.1" /></td>
						<td style="font-weight: bold;"><s:property
								value="outstandingDollarDeletedSum" /></td>
					</tr>
				</tbody>
			</table>
			<div style="clear: both;"></div>
		</s:if>

		<s:if
			test="%{outstandingShekelDeleted != null && outstandingShekelDeleted.size > 0}">
			<s:set id="i" value="1" />

			<div class="report_title">
				<s:text name="report.balance.name.shekel" />
			</div>
			<div style="clear: both;"></div>
			<table>
				<thead>
					<tr>
						<th style="width: 50px"><%="#"%></th>
						<th style="width: 100px"><s:text
								name="report.balance.customer.number" /></th>
						<th style="width: 200px"><s:text
								name="report.balance.customer.name" /></th>
						<th style="width: 100px"><s:text
								name="report.balance.customer.city" /></th>
						<th style="width: 150px"><s:text
								name="report.balance.customer.balance" /><br /> <s:text
								name="currency3.1" /></th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="outstandingShekelDeleted" var="record">
						<tr>
							<td style="text-align: center;">${i}</td>
							<td><s:property value="#record.id" /> <%-- 						<td><s:property value="#record.userNumber" --%>
								<%-- 								escapeHtml="false" /> --%>
							<td><s:property value="#record.fullname" escapeHtml="false" /></td>
							<s:set id="tmp" value="%{'city.'+#record.city}" />
							<td><s:text name="%{tmp}" /></td>

							<td><s:property value="#record.balance" /></td>
						</tr>
						<s:set id="i" value="#i+1" />
					</s:iterator>
					<tr>
						<td style="border: 0" colspan="3"></td>
						<td style="border: 0; text-align: center; font-weight: bold;"><s:text
								name="report.balance.customer.sum" />&nbsp; <s:text
								name="currency3.12" /></td>
						<td style="font-weight: bold;"><s:property
								value="outstandingShekelDeletedSum" /></td>
					</tr>
				</tbody>
			</table>
			<div style="clear: both;"></div>
		</s:if>
	</s:if>
</div>
