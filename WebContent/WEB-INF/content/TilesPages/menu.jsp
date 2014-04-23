<%@taglib uri="/struts-tags" prefix="s"%>

<div id="navigation">

	<div
		class="navigation_item 
	<s:if test="%{ page == 'reporting'}">
		active_navigation_item
	</s:if>
	">
		<a href="<s:url action="reporting"/>"><s:text
				name="navigation.other.reports" /></a>
	</div>
	<div
		class="navigation_item 
		<s:if test="%{ page == 'user'}">
		active_navigation_item
	</s:if>
	">
		<a href="<s:url action="user"/>"><s:text
				name="navigation.customer.reports" /></a><br>
	</div>

	<s:if test="%{page == 'result'}">
		<div class="navigation_item active_navigation_item">
			<a><s:text name="navigation.result" /></a><br>
		</div>
	</s:if>

	<div class="navigation_item_left">
		<a href="<s:url action="logout"/>"> <s:text
				name="navigator.logout" />
		</a>
	</div>
</div>