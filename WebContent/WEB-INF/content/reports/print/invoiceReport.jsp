<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="report_results_page balance_results_report">
	<div class="report_main_title">
		<s:text name="reports.invoice.reports.title" />
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
		<div class="seperator"></div>
		<div class="seperator"></div>
		<div style="clear: both;"></div>
	</div>

	<s:if
		test="%{invoicesDollarPaid != null && invoicesDollarPaid.size > 0}">
		<s:set id="i" value="1" />

		<div class="report_title">
			<s:text name="report.invoice.name.dollar" />
		</div>
		<div style="clear: both;"></div>
		<table>
			<thead>
				<tr>
					<th style="width: 20px"><%="#"%></th>
					<th style="width: 40px"><s:text
							name="report.invoice.invoice.number" /></th>
					<th style="width: 90px"><s:text
							name="report.invoice.customer.number" /></th>
					<th style="width: 130px"><s:text
							name="report.invoice.customer.name" /></th>
					<th style="width: 80px"><s:text
							name="report.invoice.invoice.date" /></th>
					<th style="width: 60px"><s:text
							name="report.invoice.invoice.status" /></th>
					<th style="width: 100px"><s:text
							name="report.invoice.invoice.payments" /></th>
					<th style="width: 100px"><s:text
							name="report.invoice.customer.balance" /><br /> <s:text
							name="currency3.1" /></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="invoicesDollarPaid" var="invoice">
					<tr>
						<td style="text-align: center;">${i}</td>
						<td><s:property value="#invoice.invoiceId" />
						<td><s:property value="#invoice.userNumber"
								escapeHtml="false" />
						<td><s:property value="#invoice.userFullName"
								escapeHtml="false" /></td>
						<td><s:property value="#invoice.createDate" /></td>
						<s:set id="tmp" value="%{'invoice.status.'+#invoice.status}" />
						<td><s:text name="%{tmp}" /></td>
						<td><s:iterator value="#invoice.payments" var="payment">
								<s:property value="#payment" />&nbsp;
							</s:iterator></td>

						<td><s:property value="#invoice.total" /></td>
					</tr>
					<s:set id="i" value="#i+1" />
				</s:iterator>
				<tr>
					<td style="border: 0" colspan="6"></td>
					<td style="border: 0; text-align: center; font-weight: bold;">
						<s:text name="report.invoice.customer.sum" />&nbsp; <s:text
							name="currency3.1" />
					</td>
					<td style="font-weight: bold;"><s:property
							value="invoiceDollarPaidSum" /></td>
				</tr>
			</tbody>
		</table>
		<div style="clear: both;"></div>
	</s:if>

	<s:if
		test="%{invoicesDollarUnPaid != null && invoicesDollarUnPaid.size > 0}">
		<s:set id="i" value="1" />

		<div class="report_title">
			<s:text name="report.invoice.name.dollar" />
		</div>
		<div style="clear: both;"></div>
		<table>
			<thead>
				<tr>
					<th style="width: 20px"><%="#"%></th>
					<th style="width: 40px"><s:text
							name="report.invoice.invoice.number" /></th>
					<th style="width: 90px"><s:text
							name="report.invoice.customer.number" /></th>
					<th style="width: 130px"><s:text
							name="report.invoice.customer.name" /></th>
					<th style="width: 80px"><s:text
							name="report.invoice.invoice.date" /></th>
					<th style="width: 60px"><s:text
							name="report.invoice.invoice.status" /></th>
					<th style="width: 100px"><s:text
							name="report.invoice.invoice.payments" /></th>
					<th style="width: 100px"><s:text
							name="report.invoice.customer.balance" /><br /> <s:text
							name="currency3.1" /></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="invoicesDollarUnPaid" var="invoice">
					<tr>
						<td style="text-align: center;">${i}</td>
						<td><s:property value="#invoice.invoiceId" />
						<td><s:property value="#invoice.userNumber"
								escapeHtml="false" />
						<td><s:property value="#invoice.userFullName"
								escapeHtml="false" /></td>
						<td><s:property value="#invoice.createDate" /></td>
						<s:set id="tmp" value="%{'invoice.status.'+#invoice.status}" />
						<td><s:text name="%{tmp}" /></td>
						<td><s:iterator value="#invoice.payments" var="payment">
								<s:property value="#payment" />&nbsp;
							</s:iterator></td>

						<td><s:property value="#invoice.total" /></td>
					</tr>
					<s:set id="i" value="#i+1" />
				</s:iterator>
				<tr>
					<td style="border: 0" colspan="6"></td>
					<td style="border: 0; text-align: center; font-weight: bold;">
						<s:text name="report.invoice.customer.sum" />&nbsp; <s:text
							name="currency3.1" />
					</td>
					<td style="font-weight: bold;"><s:property
							value="invoiceDollarUnPaidSum" /></td>
				</tr>
			</tbody>
		</table>
		<div style="clear: both;"></div>
	</s:if>

	<s:if
		test="%{invoicesShekelPaid != null && invoicesShekelPaid.size > 0}">
		<s:set id="i" value="1" />

		<div class="report_title">
			<s:text name="report.invoice.name.shekel" />
		</div>
		<div style="clear: both;"></div>
		<table>
			<thead>
				<tr>
					<th style="width: 20px"><%="#"%></th>
					<th style="width: 40px"><s:text
							name="report.invoice.invoice.number" /></th>
					<th style="width: 90px"><s:text
							name="report.invoice.customer.number" /></th>
					<th style="width: 130px"><s:text
							name="report.invoice.customer.name" /></th>
					<th style="width: 80px"><s:text
							name="report.invoice.invoice.date" /></th>
					<th style="width: 60px"><s:text
							name="report.invoice.invoice.status" /></th>
					<th style="width: 100px"><s:text
							name="report.invoice.invoice.payments" /></th>
					<th style="width: 100px"><s:text
							name="report.invoice.customer.balance" /><br /> <s:text
							name="currency3.12" /></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="invoicesShekelPaid" var="invoice">
					<tr>
						<td style="text-align: center;">${i}</td>
						<td><s:property value="#invoice.invoiceId" />
						<td><s:property value="#invoice.userNumber"
								escapeHtml="false" />
						<td><s:property value="#invoice.userFullName"
								escapeHtml="false" /></td>
						<td><s:property value="#invoice.createDate" /></td>
						<s:set id="tmp" value="%{'invoice.status.'+#invoice.status}" />
						<td><s:text name="%{tmp}" /></td>
						<td><s:iterator value="#invoice.payments" var="payment">
								<s:property value="#payment" />
								<br>
							</s:iterator></td>
						<td><s:property value="#invoice.total" /></td>
					</tr>
					<s:set id="i" value="#i+1" />
				</s:iterator>
				<tr>
					<td style="border: 0" colspan="6"></td>
					<td style="border: 0; text-align: center; font-weight: bold;">
						<s:text name="report.invoice.customer.sum" />&nbsp; <s:text
							name="currency3.12" />
					</td>
					<td style="font-weight: bold;"><s:property
							value="invoiceShekelPaidSum" /></td>
				</tr>
			</tbody>
		</table>
		<div style="clear: both;"></div>
	</s:if>

	<s:if
		test="%{invoicesShekelUnPaid != null && invoicesShekelUnPaid.size > 0}">
		<s:set id="i" value="1" />

		<div class="report_title">
			<s:text name="report.invoice.name.shekel" />
		</div>
		<div style="clear: both;"></div>
		<table>
			<thead>
				<tr>
					<th style="width: 20px"><%="#"%></th>
					<th style="width: 40px"><s:text
							name="report.invoice.invoice.number" /></th>
					<th style="width: 90px"><s:text
							name="report.invoice.customer.number" /></th>
					<th style="width: 130px"><s:text
							name="report.invoice.customer.name" /></th>
					<th style="width: 80px"><s:text
							name="report.invoice.invoice.date" /></th>
					<th style="width: 60px"><s:text
							name="report.invoice.invoice.status" /></th>
					<th style="width: 100px"><s:text
							name="report.invoice.invoice.payments" /></th>
					<th style="width: 100px"><s:text
							name="report.invoice.customer.balance" /><br /> <s:text
							name="currency3.12" /></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="invoicesShekelUnPaid" var="invoice">
					<tr>
						<td style="text-align: center;">${i}</td>
						<td><s:property value="#invoice.invoiceId" />
						<td><s:property value="#invoice.userNumber"
								escapeHtml="false" />
						<td><s:property value="#invoice.userFullName"
								escapeHtml="false" /></td>
						<td><s:property value="#invoice.createDate" /></td>
						<s:set id="tmp" value="%{'invoice.status.'+#invoice.status}" />
						<td><s:text name="%{tmp}" /></td>
						<td><s:iterator value="#invoice.payments" var="payment">
								<s:property value="#payment" />
								<br>
							</s:iterator></td>
						<td><s:property value="#invoice.total" /></td>
					</tr>
					<s:set id="i" value="#i+1" />
				</s:iterator>
				<tr>
					<td style="border: 0" colspan="6"></td>
					<td style="border: 0; text-align: center; font-weight: bold;">
						<s:text name="report.invoice.customer.sum" />&nbsp; <s:text
							name="currency3.12" />
					</td>
					<td style="font-weight: bold;"><s:property
							value="invoiceShekelUnPaidSum" /></td>
				</tr>
			</tbody>
		</table>
		<div style="clear: both;"></div>
	</s:if>

	<s:if
		test="%{invoicesDollarDeleted != null && invoicesDollarDeleted.size > 0}">
		<s:set id="i" value="1" />

		<div class="report_title">
			<s:text name="report.invoice.name.deleted" />
			&nbsp;
			<s:text name="currency.1" />
		</div>
		<div style="clear: both;"></div>
		<table>
			<thead>
				<tr>
					<th style="width: 20px"><%="#"%></th>
					<th style="width: 40px"><s:text
							name="report.invoice.invoice.number" /></th>
					<th style="width: 90px"><s:text
							name="report.invoice.customer.number" /></th>
					<th style="width: 130px"><s:text
							name="report.invoice.customer.name" /></th>
					<th style="width: 80px"><s:text
							name="report.invoice.invoice.date" /></th>
					<th style="width: 60px"><s:text
							name="report.invoice.invoice.status" /></th>
					<th style="width: 100px"><s:text
							name="report.invoice.invoice.payments" /></th>
					<th style="width: 100px"><s:text
							name="report.invoice.customer.balance" /><br /> <s:text
							name="currency3.1" /></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="invoicesDollarDeleted" var="invoice">
					<tr>
						<td style="text-align: center;">${i}</td>
						<td><s:property value="#invoice.invoiceId" />
						<td><s:property value="#invoice.userNumber"
								escapeHtml="false" />
						<td><s:property value="#invoice.userFullName"
								escapeHtml="false" /></td>
						<td><s:property value="#invoice.createDate" /></td>
						<s:set id="tmp" value="%{'invoice.status.'+#invoice.status}" />
						<td><s:text name="%{tmp}" /></td>
						<td><s:iterator value="#invoice.payments" var="payment">
								<s:property value="#payment" />
								<br>
							</s:iterator></td>
						<td><s:property value="#invoice.total" /></td>
					</tr>
					<s:set id="i" value="#i+1" />
				</s:iterator>
				<tr>
					<td style="border: 0" colspan="6"></td>
					<td style="border: 0; text-align: center; font-weight: bold;">
						<s:text name="report.invoice.customer.sum" />&nbsp; <s:text
							name="currency3.1" />
					</td>
					<td style="font-weight: bold;"><s:property
							value="invoiceDollarDeletedSum" /></td>
				</tr>
			</tbody>
		</table>
		<div style="clear: both;"></div>
	</s:if>

	<s:if
		test="%{invoicesShekelDeleted != null && invoicesShekelDeleted.size > 0}">
		<s:set id="i" value="1" />

		<div class="report_title">
			<s:text name="report.invoice.name.deleted" />
			&nbsp;
			<s:text name="currency.12" />
		</div>
		<div style="clear: both;"></div>
		<table>
			<thead>
				<tr>
					<th style="width: 20px"><%="#"%></th>
					<th style="width: 40px"><s:text
							name="report.invoice.invoice.number" /></th>
					<th style="width: 90px"><s:text
							name="report.invoice.customer.number" /></th>
					<th style="width: 130px"><s:text
							name="report.invoice.customer.name" /></th>
					<th style="width: 80px"><s:text
							name="report.invoice.invoice.date" /></th>
					<th style="width: 60px"><s:text
							name="report.invoice.invoice.status" /></th>
					<th style="width: 100px"><s:text
							name="report.invoice.invoice.payments" /></th>
					<th style="width: 100px"><s:text
							name="report.invoice.customer.balance" /><br /> <s:text
							name="currency3.12" /></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="invoicesShekelDeleted" var="invoice">
					<tr>
						<td style="text-align: center;">${i}</td>
						<td><s:property value="#invoice.invoiceId" />
						<td><s:property value="#invoice.userNumber"
								escapeHtml="false" />
						<td><s:property value="#invoice.userFullName"
								escapeHtml="false" /></td>
						<td><s:property value="#invoice.createDate" /></td>
						<s:set id="tmp" value="%{'invoice.status.'+#invoice.status}" />
						<td><s:text name="%{tmp}" /></td>
						<td><s:iterator value="#invoice.payments" var="payment">
								<s:property value="#payment" />
								<br>
							</s:iterator></td>
						<td><s:property value="#invoice.total" /></td>
					</tr>
					<s:set id="i" value="#i+1" />
				</s:iterator>
				<tr>
					<td style="border: 0" colspan="6"></td>
					<td style="border: 0; text-align: center; font-weight: bold;">
						<s:text name="report.invoice.customer.sum" />&nbsp; <s:text
							name="currency3.12" />
					</td>
					<td style="font-weight: bold;"><s:property
							value="invoiceShekelDeletedSum" /></td>
				</tr>
			</tbody>
		</table>
		<div style="clear: both;"></div>
	</s:if>
</div>
