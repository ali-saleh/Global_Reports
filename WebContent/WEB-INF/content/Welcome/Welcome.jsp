<%@ taglib prefix="s" uri="/struts-tags"%>

<div style="clear: both;"></div>
<div id="accordion_wrapper">
	<div class="accordionButton">Test</div>
	<div class="accordionContent">
		<form action="invoice_report" method="post">
			<div class="field_wrapper" id="city-field">
				<div class="fieldlabel">
					<s:text name="users.customer.city" />
				</div>
				<div class="fieldinput">
					<select name="selectedCity">
						<s:set id="i" value="0" />
						<s:iterator value="cities" var="city">
							<option value="${i}">
								<s:property value="#city" escapeHtml="false" />
							</option>
							<s:set id="i" value="#i+1" />
						</s:iterator>
					</select>
				</div>
			</div>
			<div style="clear: both;"></div>

			<div class="subscription_period">
				<label><s:text name="report.report.period" /></label>
			</div>
			<div style="clear: both;"></div>

			<div class="fieldwrapper" id="from-date-field">
				<div class="fieldlabel">
					<s:text name="report.report.date.from" />
				</div>
				<div class="fieldinput">
					<input class="date-pick" readonly="readonly" type="text"
						id="order_fromdate" name="fromDate" value="" /> <span
						class="empty_date"></span>
				</div>
			</div>

			<div class="fieldwrapper" id="to-date-field">
				<div class="fieldlabel">
					<s:text name="report.report.date.to" />
				</div>
				<div class="fieldinput">
					<input class="date-pick" readonly="readonly" type="text"
						id="order_todate" name="toDate" value="" /> <span
						class="empty_date"></span>
				</div>
			</div>
			<div style="clear: both;"></div>
			<div style="clear: both;"></div>

			<div class="field_wrapper" id="user-field" style="width: 370px;">
				<label><s:text name="report.report.user" /></label>
				<div class="fieldinput">
					<select name="selectedItems" class="chosen-select chosen-rtl">
						<option value="0">--</option>
						<s:iterator value="customers" var="cust">
							<option value="<s:property value='#cust.id'/>">
								<s:property value="#cust.combinedName" escapeHtml="false" />
							</option>
						</s:iterator>
					</select>
				</div>
			</div>
			<div style="clear: both;"></div>

			<div class="field_wrapper" id="item-field" style="width: 370px;">
				<label><s:text name="report.report.items" /></label>
				<div class="input_area">
					<select name="selectedItems" multiple
						class="chosen-select chosen-rtl">
						<option value="0">--</option>
						<s:iterator value="items" var="item">
							<option value="<s:property value='#item.id'/>">
								<s:property value="#item.desc" escapeHtml="false" />
							</option>
						</s:iterator>
					</select>
				</div>
			</div>
			<div style="clear: both;"></div>

			<div class="fieldwrapper" id="currency-field" style="width: 500px">
				<div class="fieldlabel">
					<label><s:text name="report.report.currency" /></label>
				</div>
				<div class="fieldinput" style="width: 500px">
					<input style="float: right;" type="radio" name="currencyId"
						checked="checked" value="1"> <label style="width: 90px"><s:text
							name="report.report.both.currencies" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="radio" name="currencyId"
						value="2"> <label><s:text
							name="report.report.dollar" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="radio" name="currencyId"
						value="3"> <label><s:text
							name="report.report.shekel" /></label>
				</div>
			</div>
			<div style="clear: both;"></div>

			<div class="fieldwrapper" id="vat-field">
				<input style="float: right;" type="checkbox" checked="checked"
					name="vatSelect" value="true"><label><s:text
						name="report.vat" /></label>
			</div>
			<div style="clear: both;"></div>
			<div style="clear: both;"></div>

			<div style="float: left;">
				<input type="checkbox" checked="checked" name="showTable"
					value="true"><label>Test</label>
			</div>

			<div class="button_container" style="float: left;">
				<div class="button_left"></div>
				<div class="button">
					<input onclick="this.form.target='_blank';return true;"
						style="margin: 0" type="submit"
						value="<s:text name="find.submit" />">
				</div>
				<div class="button_right"></div>
			</div>
			<div style="clear: both;"></div>
		</form>
	</div>

	<div class="accordionButton">
		<s:text name="reports.invoice.reports.title" />
	</div>
	<div class="accordionContent">
		<form action="invoice_report" method="post">
			<!-- 		if user does not have previlege to change city, do not show this -->
			<%-- 			<s:if test=""> --%>
			<%-- 			</s:if> --%>
			<div class="field_wrapper" id="city-field">
				<div class="fieldlabel">
					<s:text name="users.customer.city" />
				</div>
				<div class="fieldinput">
					<select name="selectedCity">
						<s:set id="i" value="0" />
						<s:iterator value="cities" var="city">
							<option value="${i}">
								<s:property value="#city" escapeHtml="false" />
							</option>
							<s:set id="i" value="#i+1" />
						</s:iterator>
					</select>
				</div>
			</div>
			<div style="clear: both;"></div>
			<div class="subscription_period">
				<label><s:text name="report.report.period" /></label>
			</div>
			<div style="clear: both;"></div>
			<div class="fieldwrapper" id="from-date-field">
				<div class="fieldlabel">
					<s:text name="report.report.date.from" />
				</div>
				<div class="fieldinput">
					<input class="date-pick" readonly="readonly" type="text"
						id="order_fromdate" name="fromDate" value="" /> <span
						class="empty_date"></span>
				</div>
			</div>

			<div class="fieldwrapper" id="to-date-field">
				<div class="fieldlabel">
					<s:text name="report.report.date.to" />
				</div>
				<div class="fieldinput">
					<input class="date-pick" readonly="readonly" type="text"
						id="order_todate" name="toDate" value="" /> <span
						class="empty_date"></span>
				</div>
			</div>
			<div style="clear: both;"></div>
			<div style="clear: both;"></div>

			<div class="fieldwrapper" id="currency-field" style="width: 500px">
				<div class="fieldlabel">
					<label><s:text name="report.report.currency" /></label>
				</div>
				<div class="input_area" style="width: 500px">
					<input style="float: right;" type="radio" name="currencyId"
						checked="checked" value="3"> <label style="width: 90px"><s:text
							name="report.report.both.currencies" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="radio" name="currencyId"
						value="1"> <label><s:text
							name="report.report.dollar" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="radio" name="currencyId"
						value="2"> <label><s:text
							name="report.report.shekel" /></label>
				</div>
			</div>
			<div style="clear: both;"></div>
			<div class="fieldwrapper" id="status-field">
				<div class="input_area">
					<input style="float: right;" type="checkbox" checked="checked"
						name="invoicePaid" value="true"> <label><s:text
							name="report.invoice.report.show.paid" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="checkbox" checked="checked"
						name="invoiceUnPaid" value="true"> <label><s:text
							name="report.invoice.report.show.unpaid" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="checkbox" checked="checked"
						name="invoiceDeleted" value="true"> <label><s:text
							name="report.invoice.report.show.deleted" /></label>
				</div>
			</div>
			<div style="clear: both;"></div>
			<div style="clear: both;"></div>
			<div style="clear: both;"></div>

			<div class="fieldwrapper" id="vat-field">
				<div class="input_area">
					<input style="float: right;" type="checkbox" checked="checked"
						name="vatSelect" value="true"> <label><s:text
							name="report.vat" /></label>
				</div>
			</div>

			<div style="float: left;">
				<input type="checkbox" checked="checked" name="showTable"
					value="true"><label>Test</label>
			</div>

			<div style="clear: both;"></div>
			<div style="clear: both;"></div>
			<div class="button_container" style="float: left;">
				<div class="button_left"></div>
				<div class="button">
					<input onclick="this.form.target='_blank';return true;"
						style="margin: 0" type="submit"
						value="<s:text name="find.submit" />">
				</div>
				<div class="button_right"></div>
			</div>
			<div style="clear: both;"></div>
		</form>
	</div>

	<div class="accordionButton">
		<s:text name="reports.payment.reports.title" />
	</div>
	<div class="accordionContent">
		<form action="payment_report" method="post">
			<!-- 		if user does not have previlege to change city, do not show this -->
			<%-- 			<s:if test=""> --%>
			<%-- 			</s:if> --%>
			<div class="field_wrapper" id="city-field">
				<div class="fieldlabel">
					<s:text name="users.customer.city" />
				</div>
				<div class="fieldinput">
					<select name="selectedCity">
						<s:set id="i" value="0" />
						<s:iterator value="cities" var="city">
							<option value="${i}">
								<s:property value="#city" escapeHtml="false" />
							</option>
							<s:set id="i" value="#i+1" />
						</s:iterator>
					</select>
				</div>
			</div>
			<div style="clear: both;"></div>
			<div class="subscription_period">
				<label><s:text name="report.report.period" /></label>
			</div>
			<div style="clear: both;"></div>
			<div class="fieldwrapper" id="from-date-field">
				<div class="fieldlabel">
					<s:text name="report.report.date.from" />
				</div>
				<div class="fieldinput">
					<input class="date-pick" readonly="readonly" type="text"
						id="order_fromdate" name="fromDate" value="" /> <span
						class="empty_date"></span>
				</div>
			</div>

			<div class="fieldwrapper" id="to-date-field">
				<div class="fieldlabel">
					<s:text name="report.report.date.to" />
				</div>
				<div class="fieldinput">
					<input class="date-pick" readonly="readonly" type="text"
						id="order_todate" name="toDate" value="" /> <span
						class="empty_date"></span>
				</div>
			</div>
			<div style="clear: both;"></div>
			<div style="clear: both;"></div>

			<div class="fieldwrapper" id="currency-field" style="width: 500px">
				<div class="fieldlabel">
					<label><s:text name="report.report.currency" /></label>
				</div>
				<div class="input_area" style="width: 500px">
					<input style="float: right;" type="radio" name="currencyId"
						checked="checked" value="3"> <label style="width: 90px"><s:text
							name="report.report.both.currencies" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="radio" name="currencyId"
						value="1"> <label><s:text
							name="report.report.dollar" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="radio" name="currencyId"
						value="2"> <label><s:text
							name="report.report.shekel" /></label>
				</div>
			</div>
			<div style="clear: both;"></div>
			<div class="fieldwrapper" id="payment-method">
				<div class="fieldlabel">
					<label><s:text name="report.report.payway" /></label>
				</div>
				<div class="input_area">
					<input style="float: right;" type="radio" name="paymentMethodId"
						checked="checked" value="3"> <label style="width: 90px"><s:text
							name="reports.both" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="radio" name="paymentMethodId"
						value="1"> <label><s:text name="reports.cheque" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="radio" name="paymentMethodId"
						value="2"><label><s:text name="reports.cash" /></label>
				</div>
			</div>
			<div style="clear: both;"></div>
			<div style="clear: both;"></div>
			<div style="clear: both;"></div>

			<div class="fieldwrapper" id="deleted-field">
				<input style="float: right;" type="checkbox" checked="checked"
					name="showDeleted" value="true"> <label><s:text
						name="report.payment.report.show.deleted" /></label>
			</div>
			<div style="clear: both;"></div>
			<div style="clear: both;"></div>

			<div class="fieldwrapper" id="vat-field">
				<input style="float: right;" type="checkbox" checked="checked"
					name="vatSelect" value="true"> <label><s:text
						name="report.vat" /></label>
			</div>

			<div style="clear: both;"></div>
			<div style="clear: both;"></div>
			<div class="button_container" style="float: left;">
				<div class="button_left"></div>
				<div class="button">
					<input onclick="this.form.target='_blank';return true;"
						style="margin: 0" type="submit"
						value="<s:text name="find.submit" />">
				</div>
				<div class="button_right"></div>
			</div>
			<div style="clear: both;"></div>
		</form>
	</div>

	<div class="accordionButton">
		<s:text name="reports.balance.reports.title" />
	</div>
	<div class="accordionContent">
		<form action="outstanding_report" method="post">
			<div class="field_wrapper" id="city-field">
				<div class="fieldlabel">
					<s:text name="users.customer.city" />
				</div>
				<div class="fieldinput">
					<select name="selectedCity">
						<s:set id="i" value="0" />
						<s:iterator value="cities" var="city">
							<option value="${i}">
								<s:property value="#city" escapeHtml="false" />
							</option>
							<s:set id="i" value="#i+1" />
						</s:iterator>
					</select>
				</div>
			</div>
			<div class="fieldwrapper" id="currency-field" style="width: 500px">
				<div class="fieldlabel">
					<label><s:text name="report.report.currency" /></label>
				</div>
				<div class="input_area" style="width: 500px">
					<input style="float: right;" type="radio" name="currencyId"
						checked="checked" value="3"> <label style="width: 90px"><s:text
							name="report.report.both.currencies" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="radio" name="currencyId"
						value="1"> <label><s:text
							name="report.report.dollar" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="radio" name="currencyId"
						value="2"> <label><s:text
							name="report.report.shekel" /></label>
				</div>
			</div>

			<div style="clear: both;"></div>
			<div style="clear: both;"></div>

			<div class="fieldwrapper" id="deleted-field">
				<input style="float: right;" type="checkbox" checked="checked"
					name="showDeletedUsers" value="true"> <label><s:text
						name="report.balance.report.show.deleted" /></label>
			</div>

			<div style="clear: both;"></div>
			<div style="clear: both;"></div>
			<div class="button_container" style="float: left;">
				<div class="button_left"></div>
				<div class="button">
					<input onclick="this.form.target='_blank';return true;"
						style="margin: 0" type="submit"
						value="<s:text name="find.submit" />">
				</div>
				<div class="button_right"></div>
			</div>
			<div style="clear: both;"></div>
		</form>
	</div>

	<div class="accordionButton">
		<s:text name="reports.service.reports.title" />
	</div>
	<div class="accordionContent">
		<form action="item_report" method="post">
			<div class="field_wrapper" id="city-field">
				<div class="fieldlabel">
					<s:text name="users.customer.city" />
				</div>
				<div class="fieldinput">
					<select name="selectedCity">
						<s:set id="i" value="0" />
						<s:iterator value="cities" var="city">
							<option value="${i}">
								<s:property value="#city" escapeHtml="false" />
							</option>
							<s:set id="i" value="#i+1" />
						</s:iterator>
					</select>
				</div>
			</div>
			<div style="clear: both;"></div>

			<div class="subscription_period">
				<label><s:text name="report.report.period" /></label>
			</div>
			<div style="clear: both;"></div>

			<div class="fieldwrapper" id="from-date-field">
				<div class="fieldlabel">
					<s:text name="report.report.date.from" />
				</div>
				<div class="fieldinput">
					<input class="date-pick" readonly="readonly" type="text"
						id="order_fromdate" name="fromDate" value="" /> <span
						class="empty_date"></span>
				</div>
			</div>

			<div class="fieldwrapper" id="to-date-field">
				<div class="fieldlabel">
					<s:text name="report.report.date.to" />
				</div>
				<div class="fieldinput">
					<input class="date-pick" readonly="readonly" type="text"
						id="order_todate" name="toDate" value="" /> <span
						class="empty_date"></span>
				</div>
			</div>
			<div style="clear: both;"></div>
			<div style="clear: both;"></div>

			<div class="field_wrapper" id="user-field" style="width: 370px;">
				<label><s:text name="report.report.user" /></label>
				<div class="fieldinput">
					<select name="selectedUser" class="chosen-select chosen-rtl">
						<option value="0">--</option>
						<s:iterator value="customers" var="cust">
							<option value="<s:property value='#cust.id'/>">
								<s:property value="#cust.combinedName" escapeHtml="false" />
							</option>
						</s:iterator>
					</select>
				</div>
			</div>
			<div style="clear: both;"></div>

			<div class="field_wrapper" id="item-field" style="width: 370px;">
				<label><s:text name="report.report.items" /></label>
				<div class="input_area">
					<select name="selectedItems" multiple
						class="chosen-select chosen-rtl">
						<option value="0">--</option>
						<s:iterator value="items" var="item">
							<option value="<s:property value='#item.id'/>">
								<s:property value="#item.desc" escapeHtml="false" />
							</option>
						</s:iterator>
					</select>
				</div>
			</div>
			<div style="clear: both;"></div>

			<div class="fieldwrapper" id="currency-field" style="width: 500px">
				<div class="fieldlabel">
					<label><s:text name="report.report.currency" /></label>
				</div>
				<div class="fieldinput" style="width: 500px">
					<input style="float: right;" type="radio" name="currencyId"
						checked="checked" value="3"> <label style="width: 90px"><s:text
							name="report.report.both.currencies" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="radio" name="currencyId"
						value="1"> <label><s:text
							name="report.report.dollar" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="radio" name="currencyId"
						value="2"> <label><s:text
							name="report.report.shekel" /></label>
				</div>
			</div>
			<div style="clear: both;"></div>

			<div class="fieldwrapper" id="vat-field">
				<input style="float: right;" type="checkbox" checked="checked"
					name="vatSelect" value="true"><label><s:text
						name="report.vat" /></label>
			</div>
			<div style="clear: both;"></div>
			<div style="clear: both;"></div>

			<div class="button_container" style="float: left;">
				<div class="button_left"></div>
				<div class="button">
					<input onclick="this.form.target='_blank';return true;"
						style="margin: 0" type="submit"
						value="<s:text name="find.submit" />">
				</div>
				<div class="button_right"></div>
			</div>
			<div style="clear: both;"></div>
		</form>
	</div>

</div>