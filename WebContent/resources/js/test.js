$(function() {
	$(".report_table").dataTable();
	$(".report_table").slideDown();
	$(".chosen-select").chosen();
});

function ali_test() {
	$.ajax({
		type : "GET",
		url : "loginTest",
		success : function(result) {
			if (result != null && result.length > 0) {
				alert("There are some results" + result);
				// $("statesdivid").html(result);
			}
		},
		error : function(xhr, errmsg) {
			alert("No values found..!!" + errmsg);
		}
	});
}