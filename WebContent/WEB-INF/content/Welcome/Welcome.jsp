<%@ taglib prefix="s" uri="/struts-tags"%>


<div id="accordion">
	<h3>Section 1</h3>
	<div>
		<form action="reporting-invoices" method="post">
			<div class="field_wrapper" id="city-field">
				<label><s:property value="getText('users.customer.city')"
						escapeHtml="false" /> </label>
				<div class="input_area">
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
				<label><s:property value="getText('report.report.period')"
						escapeHtml="false" /></label>
			</div>
			<div style="clear: both;"></div>
			<div class="fieldwrapper" id="from-date-field">
				<div class="fieldlabel">
					<s:property value="getText('report.report.date.from')"
						escapeHtml="false" />
				</div>
				<div class="fieldinput">
					<input class="date-pick" readonly="readonly" type="text"
						id="order_fromdate" name="fromDate" value="" /> <span
						class="empty_date"></span>
				</div>
			</div>
			<div style="clear: both;"></div>

			<div class="fieldwrapper" id="to-date-field">
				<div class="fieldlabel">
					<s:property value="getText('report.report.date.to')"
						escapeHtml="false" />
				</div>
				<div class="fieldinput">
					<input class="date-pick" readonly="readonly" type="text"
						id="order_todate" name="toDate" value="" /> <span
						class="empty_date"></span>
				</div>
			</div>
			<div style="clear: both;"></div>
			<div style="clear: both;"></div>
			<div class="field_wrapper" id="item-field" style="width: 370px;">
				<label><s:property value="getText('report.report.items')"
						escapeHtml="false" /></label>
				<div class="input_area">
					<select name="selectedItem">
						<option value="0">--</option>
						<s:set id="i" value="1" />
						<s:iterator value="items" var="item">
							<option value="${i}">
								<s:property value="#item.desc" escapeHtml="false" />
							</option>
							<s:set id="i" value="#i+1" />
						</s:iterator>
					</select>
				</div>
			</div>
			<div style="clear: both;"></div>
			<div class="fieldwrapper" id="currency-field" style="width: 500px">
				<div class="fieldlabel">
					<label><s:property value="getText('report.report.currency')"
						escapeHtml="false" /></label>
				</div>
				<div class="fieldinput" style="width: 500px">
					<input style="float: right;" type="radio"
						name="fld_reports_currency" checked="checked" value="1"> <label
						style="width: 90px"><s:property
							value="getText('report.report.both.currencies')"
							escapeHtml="false" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="radio"
						name="fld_reports_currency" value="2"> <label><s:property
							value="getText('report.report.dollar')" escapeHtml="false" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="radio"
						name="fld_reports_currency" value="3"> <label><s:property
							value="getText('report.report.shekel')" escapeHtml="false" /></label>
				</div>
			</div>
			<div style="clear: both;"></div>
			<div class="fieldwrapper" id="vat-field">
				<div class="fieldlabel">
					<label><s:property value="getText('report.vat')"
						escapeHtml="false" /></label>
				</div>
				<div class="fieldinput">
					<input type="checkbox" checked="checked" name="vatSelect">
				</div>
			</div>

			<div style="clear: both;"></div>
			<div style="clear: both;"></div>
			<div class="button_container" style="float: left;">
				<div class="button_left"></div>
				<div class="button">
					<input onclick="this.form.target='_blank';return true;"
						style="margin: 0" type="submit"
						value="<s:property value="getText('find.submit')" escapeHtml="false" />">
				</div>
				<div class="button_right"></div>
			</div>
			<div style="clear: both;"></div>
		</form>
	</div>





	<h3>Section 2</h3>
	<div>
		<form action="reporting-invoices" method="post">
			<input type="hidden" name="action" value="balance_report">
			<div class="field_wrapper">
				<label>Label</label>
				<div class="input_area">
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
			<div class="fieldwrapper" style="width: 500px">
				<div class="fieldlabel">
					<s:property value="getText('report.report.currency')"
						escapeHtml="false" />
				</div>
				<div class="fieldinput" style="width: 500px">
					<input style="float: right;" type="radio"
						name="fld_reports_currency" checked="checked" value="1"> <label
						style="width: 90px"><s:property
							value="getText('report.report.both.currencies')"
							escapeHtml="false" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="radio"
						name="fld_reports_currency" value="2"> <label><s:property
							value="getText('report.report.dollar')" escapeHtml="false" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="radio"
						name="fld_reports_currency" value="3"> <label><s:property
							value="getText('report.report.shekel')" escapeHtml="false" /></label>
				</div>
				<div style="clear: both;"></div>
			</div>
			<div style="clear: both;"></div>
			<div style="clear: both;"></div>
			<div class="button_container" style="float: left;">
				<div class="button_left"></div>
				<div class="button">
					<input onclick="this.form.target='_blank';return true;"
						style="margin: 0" type="submit"
						value="<s:property value="getText('find.submit')" escapeHtml="false" />">
				</div>
				<div class="button_right"></div>
			</div>
			<div style="clear: both;"></div>
		</form>
	</div>

	<h3>Section 3</h3>
	<div>
		<form action="reporting-invoices" method="post">
			<input type="hidden" name="action" value="balance_report">
			<div class="field_wrapper">
				<label>Label</label>
				<div class="input_area">
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
			<div class="fieldwrapper" style="width: 500px">
				<div class="fieldlabel">
					<s:property value="getText('report.report.currency')"
						escapeHtml="false" />
				</div>
				<div class="fieldinput" style="width: 500px">
					<input style="float: right;" type="radio"
						name="fld_reports_currency" checked="checked" value="1"> <label
						style="width: 90px"><s:property
							value="getText('report.report.both.currencies')"
							escapeHtml="false" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="radio"
						name="fld_reports_currency" value="2"> <label><s:property
							value="getText('report.report.dollar')" escapeHtml="false" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="radio"
						name="fld_reports_currency" value="3"> <label><s:property
							value="getText('report.report.shekel')" escapeHtml="false" /></label>
				</div>
				<div style="clear: both;"></div>
			</div>
			<div style="clear: both;"></div>
			<div style="clear: both;"></div>
			<div class="button_container" style="float: left;">
				<div class="button_left"></div>
				<div class="button">
					<input onclick="this.form.target='_blank';return true;"
						style="margin: 0" type="submit"
						value="<s:property value="getText('find.submit')" escapeHtml="false" />">
				</div>
				<div class="button_right"></div>
			</div>
			<div style="clear: both;"></div>
		</form>
	</div>

	<h3>Section 4</h3>
	<div>
		<form action="reporting-invoices" method="post">
			<input type="hidden" name="action" value="balance_report">
			<div class="field_wrapper">
				<label>Label</label>
				<div class="input_area">
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
			<div class="fieldwrapper" style="width: 500px">
				<div class="fieldlabel">
					<s:property value="getText('report.report.currency')"
						escapeHtml="false" />
				</div>
				<div class="fieldinput" style="width: 500px">
					<input style="float: right;" type="radio"
						name="fld_reports_currency" checked="checked" value="1"> <label
						style="width: 90px"><s:property
							value="getText('report.report.both.currencies')"
							escapeHtml="false" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="radio"
						name="fld_reports_currency" value="2"> <label><s:property
							value="getText('report.report.dollar')" escapeHtml="false" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="radio"
						name="fld_reports_currency" value="3"> <label><s:property
							value="getText('report.report.shekel')" escapeHtml="false" /></label>
				</div>
				<div style="clear: both;"></div>
			</div>
			<div style="clear: both;"></div>
			<div style="clear: both;"></div>
			<div class="button_container" style="float: left;">
				<div class="button_left"></div>
				<div class="button">
					<input onclick="this.form.target='_blank';return true;"
						style="margin: 0" type="submit"
						value="<s:property value="getText('find.submit')" escapeHtml="false" />">
				</div>
				<div class="button_right"></div>
			</div>
			<div style="clear: both;"></div>
		</form>
	</div>
	<h3>Section 5</h3>
	<div>
		<form action="reporting-invoices" method="post">
			<input type="hidden" name="action" value="balance_report">
			<div class="field_wrapper">
				<label>Label</label>
				<div class="input_area">
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
			<div class="fieldwrapper" style="width: 500px">
				<div class="fieldlabel">
					<s:property value="getText('report.report.currency')"
						escapeHtml="false" />
				</div>
				<div class="fieldinput" style="width: 500px">
					<input style="float: right;" type="radio"
						name="fld_reports_currency" checked="checked" value="1"> <label
						style="width: 90px"><s:property
							value="getText('report.report.both.currencies')"
							escapeHtml="false" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="radio"
						name="fld_reports_currency" value="2"> <label><s:property
							value="getText('report.report.dollar')" escapeHtml="false" /></label>
					<div style="clear: both;"></div>
					<input style="float: right;" type="radio"
						name="fld_reports_currency" value="3"> <label><s:property
							value="getText('report.report.shekel')" escapeHtml="false" /></label>
				</div>
				<div style="clear: both;"></div>
			</div>
			<div style="clear: both;"></div>
			<div style="clear: both;"></div>
			<div class="button_container" style="float: left;">
				<div class="button_left"></div>
				<div class="button">
					<input onclick="this.form.target='_blank';return true;"
						style="margin: 0" type="submit"
						value="<s:property value="getText('find.submit')" escapeHtml="false" />">
				</div>
				<div class="button_right"></div>
			</div>
			<div style="clear: both;"></div>
		</form>
	</div>
</div>
