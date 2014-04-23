<%@taglib uri="/struts-tags" prefix="s"%>

<div id="navigation">

	<div
		class="navigation_item 
		<s:if test="%{ page == 'invoice'}">
		active_navigation_item
	</s:if>
	">
		<a href="<s:url action="invoice_reports"/>"><s:text
				name="navigation.invoice.reports" /></a><br>
	</div>

	<div
		class="navigation_item 
		<s:if test="%{ page == 'user'}">
		active_navigation_item
	</s:if>
	">
		<a href="<s:url action="user_reports"/>"><s:text
				name="navigation.customer.reports" /></a><br>
	</div>

	<div
		class="navigation_item 
		<s:if test="%{ page == 'payment'}">
		active_navigation_item
	</s:if>
	">
		<a href="<s:url action="payment_reports"/>"><s:text
				name="navigation.payment.reports" /></a><br>
	</div>

	<div
		class="navigation_item 
	<s:if test="%{ page == 'other'}">
		active_navigation_item
	</s:if>
	">
		<a href="<s:url action="reporting"/>"><s:text
				name="navigation.other.reports" /></a>
	</div>

	<s:if test="%{page == 'result'}">
		<div class="navigation_item active_navigation_item">
			<a><s:text name="navigation.result" /></a><br>
		</div>
	</s:if>

	<div class="navigation_item_left">
		<a href="<s:url action="logout"/>"> <s:text
				name="navigation.logout" />
		</a>
	</div>
</div>