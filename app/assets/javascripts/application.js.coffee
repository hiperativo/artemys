//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require fancybox

$ ->

	$(".carousel").carousel
		interval: 1000

	$("[data-lightbox]").fancybox()

	$(".category-selector").click ->
		category = $(this).text()
		if category != "Todas"
			$("[data-category]").hide()
			$("[data-category=#{category}]").fadeIn()
		else 
			$("[data-category]").fadeIn()
		
		false