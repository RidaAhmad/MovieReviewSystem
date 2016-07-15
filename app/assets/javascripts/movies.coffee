# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.poster-display').load(->
    $(this).data 'height', @height
  ).bind 'mouseenter mouseleave', (event) ->
    $(this).stop().animate height: $(this).data('height') * (if event.type == 'mouseenter' then 2.5 else 1)
