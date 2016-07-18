# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'page:change', ->
  $('.avg-star-rating').raty
    path: '/assets/'
    readOnly: true
    score: ->
      $(this).attr 'data-score'

  $('.star-rating').raty
    path: '/assets/'

    score: ->
      $(this).attr 'data-score'

    click: (score, evt) ->
      user_id = $('#user_id').val()
      movie_id = $('#movie_id').val()
      id = $('#rating_id').val()
      already_rated = $('#already_rated').val();

      if already_rated == '0'
        $.ajax
          type: 'POST'
          url: '/movies/' + movie_id + '/ratings'
          data: rating:
            movie_id: movie_id
            user_id: user_id
            score: score
          dataType: 'json'
          success: (data) ->
            $('.avg-star-rating').raty 'set', score: data.average
            $('#already_rated').val(1);
            $('#rating_id').val(data.rated);
      else
        $.ajax
          type: 'PATCH'
          url: '/movies/' + movie_id + '/ratings/' + id
          data: rating:
            movie_id: movie_id
            user_id: user_id
            score: score
          dataType: 'json'
          success: (data) ->
            $('.avg-star-rating').raty 'set', score: data.average
