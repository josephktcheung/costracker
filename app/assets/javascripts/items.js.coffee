jQuery ->

  hideImg = () ->
    $('#img-thumbnail').remove()
    $('.item-attr').removeClass('col-md-8')

  $('form').on 'click', '.remove-seller', (event) ->
    $(@).prev('input[type=hidden]').val('1')
    $(@).closest('.panel').hide()
    event.preventDefault()

  $('form').on 'change', '#item_image_url', (event) ->
    url = $('#item_image_url').val()
    if $('#img-thumbnail').length
      $('#img-thumbnail').attr('src', url)
      $('#img-thumbnail').error(hideImg())
    else
      $('#item-form > *').addClass('col-md-8')
      img = $('<img src="'+url+'" alt="Item url" class="img-thumbnail col-md-4" id="img-thumbnail"/>')
      $('#item-form').prepend(img)


  $('form').on 'click', '.fetch-details', (event) ->
    url = $('.fetch-details').closest('.panel-body').children('.url').children('input').attr('value')
    price_tag = $('.fetch-details').closest('.panel-body').children('.price-tag').children('input').attr('value')
    price_id = $('.fetch-details').closest('.panel-body').children('.price-tag').children('input').attr('id')
    stock_tag = $('.fetch-details').closest('.panel-body').children('.stock-tag').children('input').attr('value')
    stock_id = $('.fetch-details').closest('.panel-body').children('.stock-tag').children('input').attr('id')
    data = {url: url, price_tag: price_tag, stock_tag: stock_tag, price_id: price_id, stock_id: stock_id}
    $.ajax(type: 'POST', url: 'fetch_details', data: data)

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(@).data('id'), 'g')
    $(@).before($(@).data('fields').replace(regexp, time))
    event.preventDefault()