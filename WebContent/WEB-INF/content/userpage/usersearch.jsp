<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="page_title">
	<s:property value="getText('reports.service.reports.title')"
		escapeHtml="false" />
</div>

<div>

<form action="" id="testForm">

<label for="search">Enter search string</label>
<input name="search">
<input type="submit" value="Search">

<!-- <input type="submit" value="Test" onclick="ali_test()"> -->
</form>
</div>

<div class="accordionButton">
	Results
</div>

<div id="result accordionContent">

</div>