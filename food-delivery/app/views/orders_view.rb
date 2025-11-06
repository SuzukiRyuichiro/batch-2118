class OrdersView
  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}: #{order.meal.name} delivered to #{order.customer.name} in #{order.customer.address} by #{order.employee.username}"
    end
  end

  def ask_for_index
    puts 'Please choose a number'
    gets.chomp.to_i - 1
  end
end
