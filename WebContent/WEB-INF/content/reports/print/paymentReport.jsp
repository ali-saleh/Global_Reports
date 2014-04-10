<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="report_results_page balance_results_report">
	<div class="report_main_title">
		<s:text name="reports.payment.reports.title"></s:text>

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
			<div class="report_payway">
				<s:text name="report.report.payway" />
				:&nbsp;
				<s:if test="%{ paymentMethodId == 3 }">
					<s:text name="reports.both" />
				</s:if>
				<s:elseif test="%{ paymentMethodId == 2 }">
					<s:text name="reports.cash" />
				</s:elseif>
				<s:elseif test="%{ paymentMethodId == 1 }">
					<s:text name="reports.cheque" />
				</s:elseif>
			</div>
		</div>
		<div class="seperator"></div>
		<div class="seperator"></div>
		<div style="clear: both;"></div>
	</div>

	<s:if
		test="%{paymentsDollarCash != null && paymentsDollarCash.size > 0}">
		<s:set id="i" value="1" />

		<div class="report_title">
			<s:text name="report.payment.name.dollar.cash" />
		</div>
		<div style="clear: both;"></div>
		<table>
			<thead>
				<tr>
					<th style="width: 20px"><%="#"%></th>
					<th style="width: 40px"><s:text
							name="report.payment.payment.number" /></th>
					<th style="width: 90px"><s:text
							name="report.payment.customer.number" /></th>
					<th style="width: 130px"><s:text
							name="report.payment.customer.name" /></th>
					<th style="width: 80px"><s:text
							name="report.payment.payment.date" /></th>
					<th style="width: 100px"><s:text
							name="report.payment.payment.invoices" /></th>
					<th style="width: 100px"><s:text
							name="report.payment.payment.amount" /><br /> <s:text
							name="currency3.1" /></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="paymentsDollarCash" var="payment">
					<tr>
						<td style="text-align: center;">${i}</td>
						<td><s:property value="#payment.paymentId" /></td>
						<td><s:property value="#payment.userNumber" /></td>
						<td><s:property value="#payment.userFullName"
								escapeHtml="false" /></td>
						<td><s:property value="#payment.paymentDate" /></td>
						<td><s:iterator value="#payment.invoices" var="invoice">
								<s:property value="#invoice" />&nbsp;
							</s:iterator></td>

						<td><s:property value="#payment.amount" /></td>
					</tr>
					<s:set id="i" value="#i+1" />
				</s:iterator>
				<tr>
					<td style="border: 0" colspan="5"></td>
					<td style="border: 0; text-align: center; font-weight: bold;">
						<s:text name="report.payment.customer.sum" />&nbsp; <s:text
							name="currency3.1" />
					</td>
					<td style="font-weight: bold;"><s:property
							value="paymentsDollarCashSum" /></td>
				</tr>
			</tbody>
		</table>
		<div style="clear: both;"></div>
	</s:if>

	<s:if
		test="%{paymentsDollarCheque != null && paymentsDollarCheque.size > 0}">
		<s:set id="i" value="1" />

		<div class="report_title">
			<s:text name="report.payment.name.dollar.cheque" />
		</div>
		<div style="clear: both;"></div>
		<table>
			<thead>
				<tr>
					<th style="width: 20px"><%="#"%></th>
					<th style="width: 40px"><s:text
							name="report.payment.payment.number" /></th>
					<th style="width: 90px"><s:text
							name="report.payment.customer.number" /></th>
					<th style="width: 130px"><s:text
							name="report.payment.customer.name" /></th>
					<th style="width: 80px"><s:text
							name="report.payment.payment.date" /></th>
					<th style="width: 100px"><s:text
							name="report.payment.payment.invoices" /></th>
					<th style="width: 100px"><s:text
							name="report.payment.payment.amount" /><br /> <s:text
							name="currency3.1" /></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="paymentsDollarCheque" var="payment">
					<tr>
						<td style="text-align: center;" rowspan="2">${i}</td>
						<td><s:property value="#payment.paymentId" /></td>
						<td><s:property value="#payment.userNumber" /></td>
						<td><s:property value="#payment.userFullName"
								escapeHtml="false" /></td>
						<td><s:property value="#payment.paymentDate" /></td>
						<td><s:iterator value="#payment.invoices" var="invoice">
								<s:property value="#invoice" />&nbsp;
							</s:iterator></td>
						<td><s:property value="#payment.amount" /></td>
					</tr>
					<tr style="font-size: 9px; font-style: italic;">
						<td style="font-weight: bold;"><s:text
								name="report.payment.cheque.number" /></td>
						<td><s:property value="#payment.chequeInfo.chequeId"
								escapeHtml="false" /></td>
						<td style="font-weight: bold;"><s:text
								name="report.payment.cheque.bank" /></td>
						<td><s:property value="#payment.chequeInfo.bankName"
								escapeHtml="false" /></td>
						<td style="font-weight: bold;"><s:text
								name="report.payment.cheque.date" /></td>
						<td><s:property value="#payment.chequeInfo.chequeDate" /></td>
					</tr>

					<s:set id="i" value="#i+1" />
				</s:iterator>
				<tr>
					<td style="border: 0" colspan="5"></td>
					<td style="border: 0; text-align: center; font-weight: bold;">
						<s:text name="report.payment.customer.sum" />&nbsp; <s:text
							name="currency3.1" />
					</td>
					<td style="font-weight: bold;"><s:property
							value="paymentsDollarChequeSum" /></td>
				</tr>
			</tbody>
		</table>
		<div style="clear: both;"></div>
	</s:if>

	<s:if
		test="%{paymentsShekelCash != null && paymentsShekelCash.size > 0}">
		<s:set id="i" value="1" />

		<div class="report_title">
			<s:text name="report.payment.name.shekel.cash" />
		</div>
		<div style="clear: both;"></div>
		<table>
			<thead>
				<tr>
					<th style="width: 20px"><%="#"%></th>
					<th style="width: 40px"><s:text
							name="report.payment.payment.number" /></th>
					<th style="width: 90px"><s:text
							name="report.payment.customer.number" /></th>
					<th style="width: 130px"><s:text
							name="report.payment.customer.name" /></th>
					<th style="width: 80px"><s:text
							name="report.payment.payment.date" /></th>
					<th style="width: 100px"><s:text
							name="report.payment.payment.invoices" /></th>
					<th style="width: 100px"><s:text
							name="report.payment.payment.amount" /><br /> <s:text
							name="currency3.12" /></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="paymentsShekelCash" var="payment">
					<tr>
						<td style="text-align: center;">${i}</td>
						<td><s:property value="#payment.paymentId" /></td>
						<td><s:property value="#payment.userNumber" /></td>
						<td><s:property value="#payment.userFullName"
								escapeHtml="false" /></td>
						<td><s:property value="#payment.paymentDate" /></td>
						<td><s:iterator value="#payment.invoices" var="invoice">
								<s:property value="#invoice" />&nbsp;
							</s:iterator></td>

						<td><s:property value="#payment.amount" /></td>
					</tr>
					<s:set id="i" value="#i+1" />
				</s:iterator>
				<tr>
					<td style="border: 0" colspan="5"></td>
					<td style="border: 0; text-align: center; font-weight: bold;">
						<s:text name="report.payment.customer.sum" />&nbsp; <s:text
							name="currency3.12" />
					</td>
					<td style="font-weight: bold;"><s:property
							value="paymentsShekelCashSum" /></td>
				</tr>
			</tbody>
		</table>
		<div style="clear: both;"></div>
	</s:if>

	<s:if
		test="%{paymentsShekelCheque != null && paymentsShekelCheque.size > 0}">
		<s:set id="i" value="1" />

		<div class="report_title">
			<s:text name="report.payment.name.shekel.cheque" />
		</div>
		<div style="clear: both;"></div>
		<table>
			<thead>
				<tr>
					<th style="width: 20px"><%="#"%></th>
					<th style="width: 40px"><s:text
							name="report.payment.payment.number" /></th>
					<th style="width: 90px"><s:text
							name="report.payment.customer.number" /></th>
					<th style="width: 130px"><s:text
							name="report.payment.customer.name" /></th>
					<th style="width: 80px"><s:text
							name="report.payment.payment.date" /></th>
					<th style="width: 100px"><s:text
							name="report.payment.payment.invoices" /></th>
					<th style="width: 100px"><s:text
							name="report.payment.payment.amount" /><br /> <s:text
							name="currency3.12" /></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="paymentsShekelCheque" var="payment">
					<tr>
						<td style="text-align: center;" rowspan="2">${i}</td>
						<td><s:property value="#payment.paymentId" /></td>
						<td><s:property value="#payment.userNumber" /></td>
						<td><s:property value="#payment.userFullName"
								escapeHtml="false" /></td>
						<td><s:property value="#payment.paymentDate" /></td>
						<td><s:iterator value="#payment.invoices" var="invoice">
								<s:property value="#invoice" />&nbsp;
							</s:iterator></td>
						<td><s:property value="#payment.amount" /></td>
					</tr>
					<tr style="font-size: 9px; font-style: italic;">
						<td style="font-weight: bold;"><s:text
								name="report.payment.cheque.number" /></td>
						<td><s:property value="#payment.chequeInfo.chequeId"
								escapeHtml="false" /></td>
						<td style="font-weight: bold;"><s:text
								name="report.payment.cheque.bank" /></td>
						<td><s:property value="#payment.chequeInfo.bankName"
								escapeHtml="false" /></td>
						<td style="font-weight: bold;"><s:text
								name="report.payment.cheque.date" /></td>
						<td><s:property value="#payment.chequeInfo.chequeDate" /></td>
					</tr>

					<s:set id="i" value="#i+1" />
				</s:iterator>
				<tr>
					<td style="border: 0" colspan="5"></td>
					<td style="border: 0; text-align: center; font-weight: bold;">
						<s:text name="report.payment.customer.sum" />&nbsp; <s:text
							name="currency3.12" />
					</td>
					<td style="font-weight: bold;"><s:property
							value="paymentsShekelChequeSum" /></td>
				</tr>
			</tbody>
		</table>
		<div style="clear: both;"></div>
	</s:if>


	<s:if
		test="%{paymentsDollarCashDeleted != null && paymentsDollarCashDeleted.size > 0}">
		<s:set id="i" value="1" />

		<div class="report_title">
			<s:text name="report.payment.name.dollar.cash" />
			&nbsp;
			<s:text name="report.deleted" />
		</div>
		<div style="clear: both;"></div>
		<table>
			<thead>
				<tr>
					<th style="width: 20px"><%="#"%></th>
					<th style="width: 40px"><s:text
							name="report.payment.payment.number" /></th>
					<th style="width: 90px"><s:text
							name="report.payment.customer.number" /></th>
					<th style="width: 130px"><s:text
							name="report.payment.customer.name" /></th>
					<th style="width: 80px"><s:text
							name="report.payment.payment.date" /></th>
					<th style="width: 100px"><s:text
							name="report.payment.payment.invoices" /></th>
					<th style="width: 100px"><s:text
							name="report.payment.payment.amount" /><br /> <s:text
							name="currency3.1" /></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="paymentsDollarCashDeleted" var="payment">
					<tr>
						<td style="text-align: center;">${i}</td>
						<td><s:property value="#payment.paymentId" /></td>
						<td><s:property value="#payment.userNumber" /></td>
						<td><s:property value="#payment.userFullName"
								escapeHtml="false" /></td>
						<td><s:property value="#payment.paymentDate" /></td>
						<td><s:iterator value="#payment.invoices" var="invoice">
								<s:property value="#invoice" />&nbsp;
							</s:iterator></td>

						<td><s:property value="#payment.amount" /></td>
					</tr>
					<s:set id="i" value="#i+1" />
				</s:iterator>
				<tr>
					<td style="border: 0" colspan="5"></td>
					<td style="border: 0; text-align: center; font-weight: bold;">
						<s:text name="report.payment.customer.sum" />&nbsp; <s:text
							name="currency3.1" />
					</td>
					<td style="font-weight: bold;"><s:property
							value="paymentsDollarCashDeletedSum" /></td>
				</tr>
			</tbody>
		</table>
		<div style="clear: both;"></div>
	</s:if>

	<s:if
		test="%{paymentsDollarChequeDeleted != null && paymentsDollarChequeDeleted.size > 0}">
		<s:set id="i" value="1" />

		<div class="report_title">
			<s:text name="report.payment.name.dollar.cheque" />
			&nbsp;
			<s:text name="report.deleted" />
		</div>
		<div style="clear: both;"></div>
		<table>
			<thead>
				<tr>
					<th style="width: 20px"><%="#"%></th>
					<th style="width: 40px"><s:text
							name="report.payment.payment.number" /></th>
					<th style="width: 90px"><s:text
							name="report.payment.customer.number" /></th>
					<th style="width: 130px"><s:text
							name="report.payment.customer.name" /></th>
					<th style="width: 80px"><s:text
							name="report.payment.payment.date" /></th>
					<th style="width: 100px"><s:text
							name="report.payment.payment.invoices" /></th>
					<th style="width: 100px"><s:text
							name="report.payment.payment.amount" /><br /> <s:text
							name="currency3.1" /></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="paymentsDollarChequeDeleted" var="payment">
					<tr>
						<td style="text-align: center;" rowspan="2">${i}</td>
						<td><s:property value="#payment.paymentId" /></td>
						<td><s:property value="#payment.userNumber" /></td>
						<td><s:property value="#payment.userFullName"
								escapeHtml="false" /></td>
						<td><s:property value="#payment.paymentDate" /></td>
						<td><s:iterator value="#payment.invoices" var="invoice">
								<s:property value="#invoice" />&nbsp;
							</s:iterator></td>
						<td><s:property value="#payment.amount" /></td>
					</tr>
					<tr style="font-size: 9px; font-style: italic;">
						<td style="font-weight: bold;"><s:text
								name="report.payment.cheque.number" /></td>
						<td><s:property value="#payment.chequeInfo.chequeId"
								escapeHtml="false" /></td>
						<td style="font-weight: bold;"><s:text
								name="report.payment.cheque.bank" /></td>
						<td><s:property value="#payment.chequeInfo.bankName"
								escapeHtml="false" /></td>
						<td style="font-weight: bold;"><s:text
								name="report.payment.cheque.date" /></td>
						<td><s:property value="#payment.chequeInfo.chequeDate" /></td>
					</tr>

					<s:set id="i" value="#i+1" />
				</s:iterator>
				<tr>
					<td style="border: 0" colspan="5"></td>
					<td style="border: 0; text-align: center; font-weight: bold;">
						<s:text name="report.payment.customer.sum" />&nbsp; <s:text
							name="currency3.1" />
					</td>
					<td style="font-weight: bold;"><s:property
							value="paymentsDollarChequeDeletedSum" /></td>
				</tr>
			</tbody>
		</table>
		<div style="clear: both;"></div>
	</s:if>

	<s:if
		test="%{paymentsShekelCashDeleted != null && paymentsShekelCashDeleted.size > 0}">
		<s:set id="i" value="1" />

		<div class="report_title">
			<s:text name="report.payment.name.shekel.cash" />
			&nbsp;
			<s:text name="report.deleted" />
		</div>
		<div style="clear: both;"></div>
		<table>
			<thead>
				<tr>
					<th style="width: 20px"><%="#"%></th>
					<th style="width: 40px"><s:text
							name="report.payment.payment.number" /></th>
					<th style="width: 90px"><s:text
							name="report.payment.customer.number" /></th>
					<th style="width: 130px"><s:text
							name="report.payment.customer.name" /></th>
					<th style="width: 80px"><s:text
							name="report.payment.payment.date" /></th>
					<th style="width: 100px"><s:text
							name="report.payment.payment.invoices" /></th>
					<th style="width: 100px"><s:text
							name="report.payment.payment.amount" /><br /> <s:text
							name="currency3.12" /></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="paymentsShekelCashDeleted" var="payment">
					<tr>
						<td style="text-align: center;">${i}</td>
						<td><s:property value="#payment.paymentId" /></td>
						<td><s:property value="#payment.userNumber" /></td>
						<td><s:property value="#payment.userFullName"
								escapeHtml="false" /></td>
						<td><s:property value="#payment.paymentDate" /></td>
						<td><s:iterator value="#payment.invoices" var="invoice">
								<s:property value="#invoice" />&nbsp;
							</s:iterator></td>

						<td><s:property value="#payment.amount" /></td>
					</tr>
					<s:set id="i" value="#i+1" />
				</s:iterator>
				<tr>
					<td style="border: 0" colspan="5"></td>
					<td style="border: 0; text-align: center; font-weight: bold;">
						<s:text name="report.payment.customer.sum" />&nbsp; <s:text
							name="currency3.12" />
					</td>
					<td style="font-weight: bold;"><s:property
							value="paymentsShekelCashDeletedSum" /></td>
				</tr>
			</tbody>
		</table>
		<div style="clear: both;"></div>
	</s:if>

	<s:if
		test="%{paymentsShekelChequeDeleted != null && paymentsShekelChequeDeleted.size > 0}">
		<s:set id="i" value="1" />

		<div class="report_title">
			<s:text name="report.payment.name.shekel.cheque" />
			&nbsp;
			<s:text name="report.deleted" />
		</div>
		<div style="clear: both;"></div>
		<table>
			<thead>
				<tr>
					<th style="width: 20px"><%="#"%></th>
					<th style="width: 40px"><s:text
							name="report.payment.payment.number" /></th>
					<th style="width: 90px"><s:text
							name="report.payment.customer.number" /></th>
					<th style="width: 130px"><s:text
							name="report.payment.customer.name" /></th>
					<th style="width: 80px"><s:text
							name="report.payment.payment.date" /></th>
					<th style="width: 100px"><s:text
							name="report.payment.payment.invoices" /></th>
					<th style="width: 100px"><s:text
							name="report.payment.payment.amount" /><br /> <s:text
							name="currency3.12" /></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="paymentsShekelChequeDeleted" var="payment">
					<tr>
						<td style="text-align: center;" rowspan="2">${i}</td>
						<td><s:property value="#payment.paymentId" /></td>
						<td><s:property value="#payment.userNumber" /></td>
						<td><s:property value="#payment.userFullName"
								escapeHtml="false" /></td>
						<td><s:property value="#payment.paymentDate" /></td>
						<td><s:iterator value="#payment.invoices" var="invoice">
								<s:property value="#invoice" />&nbsp;
							</s:iterator></td>
						<td><s:property value="#payment.amount" /></td>
					</tr>
					<tr style="font-size: 9px; font-style: italic;">
						<td style="font-weight: bold;"><s:text
								name="report.payment.cheque.number" /></td>
						<td><s:property value="#payment.chequeInfo.chequeId"
								escapeHtml="false" /></td>
						<td style="font-weight: bold;"><s:text
								name="report.payment.cheque.bank" /></td>
						<td><s:property value="#payment.chequeInfo.bankName"
								escapeHtml="false" /></td>
						<td style="font-weight: bold;"><s:text
								name="report.payment.cheque.date" /></td>
						<td><s:property value="#payment.chequeInfo.chequeDate" /></td>
					</tr>

					<s:set id="i" value="#i+1" />
				</s:iterator>
				<tr>
					<td style="border: 0" colspan="5"></td>
					<td style="border: 0; text-align: center; font-weight: bold;">
						<s:text name="report.payment.customer.sum" />&nbsp; <s:text
							name="currency3.12" />
					</td>
					<td style="font-weight: bold;"><s:property
							value="paymentsShekelChequeDeletedSum" /></td>
				</tr>
			</tbody>
		</table>
		<div style="clear: both;"></div>
	</s:if>
</div>