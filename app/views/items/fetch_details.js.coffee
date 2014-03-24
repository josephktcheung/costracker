console.log $(<%= @price_id %>).context.value = '<%= @seller.price_to_cents.nil? ? "Cannot fetch price" : @seller.price_to_cents / 100 %>'
console.log $(<%= @stock_id %>).context.value = '<%= @seller.stock.nil? ? "Cannot fetch stock" : @seller.stock %>'
# console.log $(<%= @price_id %>).context.value = <%= @seller.price_to_cents.nil? ? '' : @seller.price_to_cents / 100 %>
# console.log $(<%= @stock_id %>).context.value