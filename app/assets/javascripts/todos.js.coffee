# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$("input[id$='due_at']").each (index) -> 
		console.log $(this).val()
		$(this).fdatetimepicker
			closeButton: true
			startDate: "2013-12-12 22:00"
		
	$("input[id$='due_at']").on "click", ->
		console.log $(this).val()
		$(this).fdatetimepicker 'show'