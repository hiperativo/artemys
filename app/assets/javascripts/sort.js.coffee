$ -> 
	$(".sortable").sortable
		cancel: ".dont-sort"
		update: (e, ui) -> 
			obj = $(this)
			$.post "/collection/sort", obj.sortable("serialize"), -> 
				obj.effect "highlight"
	.disableSelection()