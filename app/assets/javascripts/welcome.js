// (function (global) {
//   'use strict';

// document.getElementById('places').children[1].addEventListener("mouseenter", function(event) {
//     document.querySelector('.photo').classList.remove('hidden');
//     document.querySelector('#subtitle').classList.add('hidden');
//     });

// document.getElementById('places').children[1].addEventListener("mouseleave", function(event) {
//     document.querySelector('#subtitle').classList.remove('hidden');
//     document.querySelector('.photo').classList.add('hidden');
//     });
// });

$(document).ready(function(){
	$("#places li").mouseover(function(event) {
		var num = $(this).index();
		var image = $("#images");
		console.log(num-1);
		$("#subtitle").addClass("hidden");
		images.children[num-1].classList.remove("hidden");
	});

	$("#places li").mouseleave(function(event) {
		var num = $(this).index();
		var image = $("#images");
		$("#subtitle").removeClass("hidden");
		images.children[num-1].classList.add("hidden");
	});
});