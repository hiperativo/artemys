#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require fancybox
#= require bootstrap


$ ->

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


	if $(".map").size() > 0 

		window.place_model = $(".place").remove()
		window.places = {}
		$.get "/places.json", (data) ->
			window.places = data
			do map_interactions

		map_interactions = ->
			update_places = (city) ->
				output = ""
				for place in city
					place_html = window.place_model
					place_html.find("h4").html place.store
					place_html.find(".address").html place.address
					place_html.find(".localization").html "<i class='icon-home'></i>"+place.localization
					output += "<li data-address='#{place.address}' class='span4 place'>#{place_html.html()}</li>"

				$(".places").html(output)

				$(".place").click -> 
					$(".place").removeClass("active")
					$(this).addClass("active")
					update_map_with_address $(this).attr("data-address")


			$("#location_state").change ->
				city_html = ""
				for city, place of window.places[$(this).val()]
					city_html += "<option value='#{city}'>#{city}</option>'"

				$("#location_city").html(city_html).change()

			$("#location_city").change ->
				state = $("#location_state").val()
				city = $(this).val()
				window.places[state][city]

				update_map_with_address window.places[state][city][0]["address"]
				update_places window.places[state][city]

			map = new google.maps.Map $(".map")[0],
				zoom: 15
				mapTypeId: google.maps.MapTypeId.ROADMAP

			update_map_with_address = (address) ->
				new google.maps.Geocoder().geocode { address: address}, (results, status) ->
					if results[0]?
						position = results[0].geometry.location
						map.setCenter position
						setMarker position
					# else 
					# 	alert "The store coordinates were not found."

			markers = []
			setMarker = (position) ->
				new google.maps.Marker
					map: map
					position: position

			if navigator.geolocation
				navigator.geolocation.getCurrentPosition (position) ->
					you_are_here = new google.maps.LatLng position.coords.latitude, position.coords.longitude
					setMarker you_are_here
					map.setCenter you_are_here

			$("form.search-map").submit ->
				address = ""
				for item in ["city", "state", "country"]
					address += $(this).find("#location_"+item).val()+", "
				update_map_with_address address
				console.log address
				false


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



