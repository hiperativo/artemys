#= require jquery
#= require jquery_ujs
#= require jquery.ui.all
#= require fancybox
#= require bootstrap
#= require dropzone
#= require place_selector

$ ->
	$("form.live-update *").change ->
		form = $(this).closest("form")
		$(this).closest("form").submit()
		$(this).effect "highlight"
		false

	$("form.live-update").submit ->
		data = $(this).serialize()
		$.post $(this).attr("action"), data
		false

	$(".carousel").carousel
		interval: 5000

	$("[data-lightbox]").fancybox()

	$(".category-selector").click ->
		category = $(this).text()
		if category != "Todas"
			$("[data-category]").hide()
			$("[data-category='#{category}']").fadeIn()
		else 
			$("[data-category]").fadeIn()
		
		false
	do $(".category-selector").first().click

	$("#gallery-categories a").click ->
		$("#gallery-categories .active").removeClass "active"
		$(this).parent().addClass "active"


	$(".add-watermark").click ->
		$(this)
		.toggleClass("btn-danger")
		.toggleClass("btn-primary")
		.find(".icon")
		.toggleClass("icon-plus")
		.toggleClass("icon-minus")

	show_when_is_hidden = (hidden_element, what_to_show) ->
		hidden_element.attr "data-visible", "true"

		$(".gallery-categories-float a").click -> 
			$("html, body").scrollTop hidden_element.offset()['top'] - 15

		$(window).scroll -> 
		
			is_visible = (hidden_element.offset()['top'] - $(window).scrollTop()) > 0
			was_visible = hidden_element.attr("data-visible") == "true"

			set_visible = -> hidden_element.attr "data-visible", "true"
			set_hidden = -> hidden_element.attr "data-visible", "false"

			if is_visible
				if !was_visible
					do set_visible
					what_to_show.css
						top: "-34px"
			else
				if was_visible
					do set_hidden
					what_to_show.css
						top: 0

	if $(".gallery-categories-float").size() > 0
		show_when_is_hidden $("#gallery-categories"), $(".gallery-categories-float")



