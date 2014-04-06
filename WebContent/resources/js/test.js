$(function() {
	$(".report_table").dataTable();
	$(".report_table").slideDown();
	$(".chosen-select").chosen(
			{
				enable_split_word_search: true,
				search_contains: true
			});
	
	$("#testForm").submit(ali_test);
	
});

function ali_test() {
	
	var formInput=$(this).serialize();
	
	$.getJSON('Ajax/jsonTest', formInput,function(data) {
		 
		$('#result').html('' + data.greeting + '');
		 
		$.each(data.userList,function(index, value){
			$('#result').append(value);
		});
		
		$.each(data.countryMap,function(key, value){
		//console.log("key "+ key + ", value " + value);
		});
		});
		 
		return false;
//	$.ajax({
//		type : "POST",
//		url : "userTest?search='+ $('search').value",
//		success : function(result) {
//			if (result != null && result.length > 0) {
//				
//				$("#example").append(result);
//				// $("statesdivid").html(result);
//				var otherVariable="<s:property value=\"res\"/>";
//				$("#example").append(otherVariable);
//			}
//		},
//		error : function(xhr, errmsg) {
//			alert("No values found..!!" + errmsg);
//		}
//	});
}