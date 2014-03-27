console.log $(<%= @price_id %>).context.value = '<%= @seller.temp_price.nil? ? "Cannot fetch price" : @seller.temp_price %>'
console.log $(<%= @stock_id %>).context.value = '<%= @seller.stock.nil? ? "Cannot fetch stock" : @seller.stock %>'
console.log $(<%= @price_id %>).closest('.panel-body').children('.hide').removeClass('hide')