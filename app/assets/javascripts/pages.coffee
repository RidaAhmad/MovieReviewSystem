# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.msg-container').fadeOut 5000

$(document).on 'page:change', ->
  $('.carousel-inner img').click (e) ->
    $('#image-modal img').attr 'src', $(this).attr('src')
    $('#image-modal').modal('show');
