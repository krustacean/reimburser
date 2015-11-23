// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function() {

	function createHTML(response) {
	// "<div class='product-box'><a target='_blank' href='"+ response.listing_url + "'>"
	return "<div class='thumbnail'>"
	+ "<div class = 'imagethumb'><img src='" + response.image_url + "' width='120' height='160'></div>"
    + "<div class='caption'><h5 class= 'thumbname'>" + response.name.substring(0,75) + "</h5></div>"
	+ "<p class='product-price'>" + response.current_price + " on <a href=" + response.listing_url + ">Amazon.com</a><br></p><div>"
	+ "<span class='btn btn-default'><span class='a-button-inner'>"
	+ "<input class='a-button-input' type='submit' value='Submit'>"
	+ "</span></a></span>";
	}

	$("#searchstuff").on('submit', function(e){

		$(".showresults").empty();
		e.preventDefault();
		var search = $("#searchInput").val();
		console.log(search);
		$.ajax({
			url: "/transactions/search/" + search ,
			dataType: 'json',
			success: function(data){
				data.forEach(function(listing){
					$(".showresults").append(createHTML(listing));
					// $(".showresults").append(n.name, n.current_price, n.image_url);
				});
			}
		});
	});
});
