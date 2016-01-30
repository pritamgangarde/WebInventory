function getCityFromState(state) 	
{

	$.ajax({
		type : "POST",
		url : "getCity.html",
		data : "state=" + state,
		async:false,
		cache:false,
		success : function(response) {
			$("#city").html(response);	
		},
		error : function(e) {
			alert(e);
		}
	});
return false;
}