<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="company_name">
	<s:property value="getText('login.title')" escapeHtml="false" />
	<div class="company_description">
		<s:property value="getText('company.description')" escapeHtml="false" />
	</div>
</div>
<div class="company_image">
	<img width="180px"
		src="${pageContext.request.contextPath}/resources/images/logobw.png" />
</div>
<div style="clear: both;"></div>
<div class="seperator"></div>
<div class="seperator"></div>
<div style="clear: both;"></div>
<div class="vat_number">
	<s:property value="getText('invoice.company.vat.number')"
		escapeHtml="false" />
</div>