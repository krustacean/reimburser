// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$("form").submit(function(){
	$.ajax({
		url: "/transactions/new",
		data: {
			format: json
		},
		success: function(data){
			data.forEach(function(n){
				$(".showresults").append(n.title);
			});
		}

	});
});
 console.log("jquery connected");
  $("form").on("ajax:success", function(data){
			data.forEach(function(n){
				$(".showresults").append(n.title);
			});
		});
 
