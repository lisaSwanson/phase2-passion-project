$(document).ready(function() {

  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
	$('a[href="add_url"]').on('click', function(e){
		e.preventDefault();
		// console.log(this);
		// alert('Sign new href executed.'); 
    $('.add_url_form').show();
  });

  
	$('#social').jqFloat({
		width: 150,
		height: 200,
		speed: 1500
	});

	$('.inset_0').jqFloat({
		width: 300,
		height: 400,
		speed: 1500
	});

	$('.inset_1').jqFloat({
		width: 500,
		height: 300,
		speed: 1500
	});

	$('.inset_2').jqFloat({
		width: 200,
		height: 300,
		speed: 1500
	});

	$('.inset_3').jqFloat({
		width: 100,
		height: 200,
		speed: 1500
	});

		$('.inset_4').jqFloat({
		width: 100,
		height: 200,
		speed: 1500
	});


});

// function showFormURLAdd(){
// 	$('.a["/dashboard/add_url"]').on('click', function(e){
// 		e.preventDefault();
// 		console.log(this):
// 		alert('Sign new href executed.'); 
// 	        // $('.add_url_form').show(slow);
// 	      });
// });

//   checkFormValidations();
// function checkFormValidations() {

// 	$('registration_form').on('submit', function(event) {
// 		event.preventDefault();

// 		var data = $(this).serialize();
// 		var request = $.ajax ({
// 			method: 'post',
// 			url: '/signup',
// 			data: data,
// 			dataType: 'json'
// 		});


// 		request.done(function(response){
//       $('.row').append("The form fields are not valid.")
//     });

// 		request.fail(function(response){
// 			alert(response.statusText)
// 		});
// 	});
// }


// function checkForm() {
// 	var container = $('article');

// 	container.on('click', '.vote-button', function(event) {
// 		event.preventDefault();

// 		var route = $(this).attr("href")
//     var request = $.ajax ({
//     	type: 'get',
//     	url: route,
//     	dataType: 'json'
//     });

//     request.done(function(response){
//     	var pointsObject = $(event.target).parent().find('.points');
//     	var upVote = $(event.target).css('color', 'red');
//     	pointsObject.text(response);
//     });

//     request.fail(function(response){
//     	alert(response.statusText)
//     });
//   });
// }