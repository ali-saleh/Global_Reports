<%@page import="utils.GCProperties"%>

<div id="headerbg">
<div id="logo"></div>
<div class="header_text">
	<% GCProperties prop = GCProperties.getSystemProperties(); %>
	<%= prop.get("system.title", null) %>
</div>
</div>