$ ->

  hideImg = () ->
    $('#img-thumbnail').remove()
    $('.item-attr').removeClass('col-md-8')

  $('form').on 'click', '.remove-seller', (event) ->
    $(@).prev('input[type=hidden]').val('1')
    $(@).closest('.panel').hide()
    event.preventDefault()

  $('form').on 'change', '#item_image_url', (event) ->
    url = $('#item_image_url').val()
    if url
      $('#img-thumbnail').attr('src', url)
    else
      $('#img-thumbnail').attr('src', 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNTAiIGhlaWdodD0iMjUwIj48cmVjdCB3aWR0aD0iMjUwIiBoZWlnaHQ9IjI1MCIgZmlsbD0iI2VlZSI+PC9yZWN0Pjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9IjEyNSIgeT0iMTI1IiBzdHlsZT0iZmlsbDojYWFhO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1zaXplOjE2cHg7Zm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+UHJldmlldyBJbWFnZTwvdGV4dD48L3N2Zz4=')


  $('form').on 'click', '.fetch-details', (event) ->
    window.clicked_link = $(@)
    url = $(@).closest('.panel-body').children('.url').children('input').val()
    currency = $('.fetch-details').closest('.panel-body').children('.currency').children('select').val()
    price_tag = $(@).closest('.panel-body').children('.price-tag').children('input').val()
    price_id = $(@).closest('.panel-body').children('.price').children('input').attr('id')
    data = {
      url: url
      price_tag: price_tag
      price_id: price_id
      currency: currency
    }
    $.ajax(type: 'POST', url: 'fetch_details', data: data)
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(@).data('id'), 'g')
    $(@).before($(@).data('fields').replace(regexp, time))
    event.preventDefault()

  $('.gridster ul').gridster({
    widget_margins: [10, 10]
    widget_base_dimensions: [140, 140]
    })