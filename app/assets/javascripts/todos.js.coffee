# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('.with-picker').on "click", ->
		console.log "IM IN IT"
		$(this).datetimepicker()