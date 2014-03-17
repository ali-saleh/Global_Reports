<%@page import="utils.GCProperties"%>

<%GCProperties prop = GCProperties.getSystemProperties();%>
<%= prop.get("print.footer", null)%>