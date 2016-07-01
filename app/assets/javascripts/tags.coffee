$ ->
	$(".tag .remove").on "ajax:success", ->
		$(this).parent().fadeout()