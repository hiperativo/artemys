class PlaceSelector
	constructor: -> 
		$.get "/places.json", (data) =>
			@places = data
			$("#location_state").change (e) => @load_cities $(e.target).val()
			$("#location_city").change (e) => @filter_places $(e.target).val()

	load_cities: (state) =>
		cities_html = ""
		for city, place of @places[state]
			cities_html += "<option value='#{city}'>#{city}</option>'"
		$("#location_city").html(cities_html).change()

	filter_places: (city) =>
		$(".place").show()
		$(".place").not("[data-city='#{city}']").hide()

$ -> new PlaceSelector