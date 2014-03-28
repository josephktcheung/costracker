$(<%= @price_id %>).context.value = '<%= @seller.temp_price.nil? ? "Cannot fetch price" : @seller.temp_price %>'
$(<%= @stock_id %>).context.value = '<%= @seller.stock.nil? ? "Cannot fetch stock" : @seller.stock %>'
$(<%= @price_id %>).closest('.panel-body').children('.hide').removeClass('hide')