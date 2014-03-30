$(<%= @price_id %>).context.value = '<%= @seller.temp_price.nil? ? "Cannot fetch price" : @seller.temp_price %>'
$(<%= @price_id %>).closest('.panel-body').children('.hide').removeClass('hide')