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
	+ "<button class='searchtransbut btn btn-raised' id= '" + response.asin + "'data-toggle='modal' data-target='#complete-dialog'>Select</button>";
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
					var id = "#"+listing.asin;
					$(".showresults").append(createHTML(listing));
					// $(".showresults").append(n.name, n.current_price, n.image_url);
					$(id).on('click', function(e){

						e.preventDefault();
						console.log(listing.listing_url);
						$("#transaction_name").val(listing.name);
						$("#transaction_asin").val(listing.asin);
						$("#transaction_upc").val(listing.upc);
						$("#transaction_listing_url").val(listing.listing_url);
						$("#transaction_purchase_price").val("");
						$("#transaction_target_price").val("");
						$("#transaction_start_date").val("");
						$("#transaction_end_date").val("");
						// var search = $("#searchInput").val();
					
					});
				});
			}
		});
	});


});
