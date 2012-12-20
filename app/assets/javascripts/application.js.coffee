//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require fancybox

$ ->

	$(".carousel").carousel
		interval: 5000

	$("[data-lightbox]").fancybox()

	$(".category-selector").click ->
		category = $(this).text()
		if category != "Todas"
			$("[data-category]").hide()
			$("[data-category=#{category}]").fadeIn()
		else 
			$("[data-category]").fadeIn()
		
		false

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
					place_html.find("p").html place.address
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