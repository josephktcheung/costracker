jQuery ->
  $('form').on 'click', '.remove-seller', (event) ->
    $(@).prev('input[type=hidden]').val('1')
    $(@).closest('.panel').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(@).data('id'), 'g')
    $(@).before($(@).data('fields').replace(regexp, time))
    event.preventDefault()