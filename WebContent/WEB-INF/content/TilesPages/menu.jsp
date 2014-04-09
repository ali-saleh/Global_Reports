<%@taglib uri="/struts-tags" prefix="s"%>

<div id="navigation">

	<div class="navigation_item 
	<s:if test="%{ page == 'reporting'}">
		active_navigation_item
	</s:if>
	">
		<a href="<s:url action="reporting"/>">Reports</a>
	</div>
	<div class="navigation_item 
		<s:if test="%{ page == 'user'}">
		active_navigation_item
	</s:if>
	">
		<a href="<s:url action="user"/>">User</a><br>
	</div>
	<div class="navigation_item_left">
		<a href="<s:url action="logout"/>">
			<s:property value="getText('navigator.logout')" escapeHtml="false"/>
		</a>
	</div>
</div>