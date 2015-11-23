// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function() {
	
	$("#searchstuff").on('submit', function(e){
		
		$(".showresults").empty();
		e.preventDefault();
		var search = $("#searchInput").val();
		console.log(search);
		$.ajax({
			url: "/transactions/search/" + search ,
			dataType: 'json',
			success: function(data){
				data.forEach(function(n){
					$(".showresults").append(n.name, n.current_price, n.image_url);
				});
			}
		});
	});	
});

