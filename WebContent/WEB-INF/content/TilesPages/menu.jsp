<%@taglib uri="/struts-tags" prefix="s"%>

<div id="navigation">
	<div class="navigation_item">
		<a href="<s:url action="reports"/>">Reports</a>
	</div>
	<div class="navigation_item">
		<a href="http://www.google.com">Test</a><br>
	</div>
	<div class="navigation_item_left">
		<a href="<s:url action="logout"/>">
			<s:property value="getText('navigator.logout')" escapeHtml="false"/>
		</a>
	</div>
</div>
<div style="clear: both;"></div>