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
		<div class="report_title">
			<s:text name="report.items.shekel" />
		</div>
		<div style="clear: both;"></div>
		<table>
			<thead>
				<tr>
					<th style="width: 50px;"><s:text name="report_item.item.id" /></th>
					<th style="width: 250px;"><s:text
							name="report_item.item.description" /></th>
					<th style="width: 50px;"><s:text
							name="report_item.item.quantity" /></th>
					<th style="width: 50px;"><s:text
							name="report_item.item.orders" /></th>
					<th style="width: 100px;"><s:text name="report_item.item.cost" />
						&nbsp;<s:text name="currency3.1" /></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="itemsReportDollar" var="item">
					<tr>
						<td style="text-align: center;"><s:property
								value="#item.itemId" /></td>
						<td><s:property value="#item.itemDescription"
								escapeHtml="false" />
						<td style="text-align: center;"><s:property
								value="#item.quantity" />
						<td style="text-align: center;"><s:property
								value="#item.orderCount" /></td>
						<td><s:property value="#item.amount" /></td>
					</tr>
				</s:iterator>
				<tr>
					<td style="border: 0" colspan="2"></td>
					<td style="border: 0; text-align: center; font-weight: bold"
						colspan="2"><s:text name="report.payment.customer.sum" />&nbsp;
						<s:text name="currency3.1" /></td>
					<td style="font-weight: bold;"><s:property
							value="itemsReportDollarSum" /></td>
				</tr>
			</tbody>
		</table>
	</s:if>

	<s:if test="%{itemsReportShekel != null && itemsReportShekel.size > 0}">
		<div class="report_title">
			<s:text name="report.items.shekel" />
		</div>
		<div style="clear: both;"></div>
		<table>
			<thead>
				<tr>
					<th style="width: 50px;"><s:text name="report_item.item.id" /></th>
					<th style="width: 250px;"><s:text
							name="report_item.item.description" /></th>
					<th style="width: 50px;"><s:text
							name="report_item.item.quantity" /></th>
					<th style="width: 50px;"><s:text
							name="report_item.item.orders" /></th>
					<th style="width: 100px;"><s:text name="report_item.item.cost" />
						&nbsp;<s:text name="currency3.12" /></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="itemsReportShekel" var="item">
					<tr>
						<td style="text-align: center;"><s:property
								value="#item.itemId" /></td>
						<td><s:property value="#item.itemDescription"
								escapeHtml="false" />
						<td style="text-align: center;"><s:property
								value="#item.quantity" />
						<td style="text-align: center;"><s:property
								value="#item.orderCount" /></td>
						<td><s:property value="#item.amount" /></td>
					</tr>
				</s:iterator>
				<tr>
					<td style="border: 0" colspan="2"></td>
					<td style="border: 0; text-align: center; font-weight: bold;"
						colspan="2"><s:text name="report.payment.customer.sum" />&nbsp;
						<s:text name="currency3.12" /></td>
					<td style="font-weight: bold;"><s:property
							value="itemsReportShekelSum" /></td>
				</tr>
			</tbody>
		</table>
	</s:if>

	<s:if
		test="%{itemsReportDollarDeleted != null && itemsReportDollarDeleted.size > 0}">
		<div class="report_title">
			<s:text name="report.items.shekel" />
		</div>
		<div style="clear: both;"></div>
		<table>
			<thead>
				<tr>
					<th style="width: 50px;"><s:text name="report_item.item.id" /></th>
					<th style="width: 250px;"><s:text
							name="report_item.item.description" /></th>
					<th style="width: 50px;"><s:text
							name="report_item.item.quantity" /></th>
					<th style="width: 50px;"><s:text
							name="report_item.item.orders" /></th>
					<th style="width: 100px;"><s:text name="report_item.item.cost" />
						&nbsp;<s:text name="currency3.1" /></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="itemsReportDollarDeleted" var="item">
					<tr>
						<td style="text-align: center;"><s:property
								value="#item.itemId" /></td>
						<td><s:property value="#item.itemDescription"
								escapeHtml="false" />
						<td style="text-align: center;"><s:property
								value="#item.quantity" />
						<td style="text-align: center;"><s:property
								value="#item.orderCount" /></td>
						<td><s:property value="#item.amount" /></td>
					</tr>
				</s:iterator>
				<tr>
					<td style="border: 0" colspan="2"></td>
					<td style="border: 0; text-align: center; font-weight: bold;"
						colspan="2"><s:text name="report.payment.customer.sum" />&nbsp;
						<s:text name="currency3.1" /></td>
					<td style="font-weight: bold;"><s:property
							value="itemsReportDollarDeletedSum" /></td>
				</tr>
			</tbody>
		</table>
	</s:if>

	<s:if
		test="%{itemsReportShekelDeleted != null && itemsReportShekelDeleted.size > 0}">
		<div class="report_title">
			<s:text name="report.items.shekel" />
		</div>
		<div style="clear: both;"></div>
		<table>
			<thead>
				<tr>
					<th style="width: 50px;"><s:text name="report_item.item.id" /></th>
					<th style="width: 250px;"><s:text
							name="report_item.item.description" /></th>
					<th style="width: 50px;"><s:text
							name="report_item.item.quantity" /></th>
					<th style="width: 50px;"><s:text
							name="report_item.item.orders" /></th>
					<th style="width: 100px;"><s:text name="report_item.item.cost" />
						&nbsp;<s:text name="currency3.12" /></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="itemsReportShekelDeleted" var="item">
					<tr>
						<td style="text-align: center;"><s:property
								value="#item.itemId" /></td>
						<td><s:property value="#item.itemDescription"
								escapeHtml="false" />
						<td style="text-align: center;"><s:property
								value="#item.quantity" />
						<td style="text-align: center;"><s:property
								value="#item.orderCount" /></td>
						<td><s:property value="#item.amount" /></td>
					</tr>
				</s:iterator>
				<tr>
					<td style="border: 0" colspan="2"></td>
					<td style="border: 0; text-align: center; font-weight: bold;"
						colspan="2"><s:text name="report.payment.customer.sum" />&nbsp;
						<s:text name="currency3.12" /></td>
					<td style="font-weight: bold;"><s:property
							value="itemsReportShekelDeletedSum" /></td>
				</tr>
			</tbody>
		</table>
	</s:if>
</div>