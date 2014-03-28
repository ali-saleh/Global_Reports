<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="login">
	<br></br> <br></br>

	<div class="login_title">
		<h1>
			<s:property value="getText('login.title')" escapeHtml="false" />
		</h1>
	</div>
	<s:actionerror />
	<form action="loginUser" method="post">
		<div class="rtl">
			<div class="rtl">
				<label><s:property value="getText('login.username')"
						escapeHtml="false" /></label><input type="text" name="username">
			</div>
			<br>
			<div class="rtl">
				<label><s:property value="getText('login.password')"
						escapeHtml="false" /></label><input type="password" name="password">
				<br>
			</div>
			<br /> <br />
			<div class="button_container" style="float: left;">
				<div class="button_left"></div>
				<div class="button">
					<input type="submit" value="<s:property value="getText('login.submit')" escapeHtml="false" />"
					style="margin: 0">
				</div>
				<div class="button_right"></div>
			</div>
		</div>
	</form>
</div>
<%-- 	<s:form action="login" method="post" cssClass="rtl"> --%>
<%-- 		<s:textfield name="username" key="login.username" cssClass="rtl" /> --%>
<%-- 		<s:password name="password" key="login.password" cssClass="rtl" /> --%>

<%-- 		<s:div class="button_container" style="float: left;"> --%>
<%-- 			<s:div class="button_left"></s:div> --%>
<%-- 			<s:submit method="execute" key="login.submit" cssClass="button" /> --%>
<%-- 			<s:div class="button_right"></s:div> --%>
<%-- 		</s:div> --%>
<%-- 	</s:form> --%>
<!-- 	<br /> -->
<!-- 	<br /> -->
<!-- 	<br /> -->