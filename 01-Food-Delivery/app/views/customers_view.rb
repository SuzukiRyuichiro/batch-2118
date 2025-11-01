class CustomersView
  # def ask_for_name
  #   puts "What is the name of the customer?"
  #   gets.chomp
  # end

  # def ask_for_address
  #   puts "What is the address of the customer?"
  #   gets.chomp
  # end

  def ask_for(thing)
    puts "What is the #{thing} of the customer?"
    gets.chomp
  end

  def display_list(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1} - #{customer.name} 🏡 #{customer.address}"
    end
  end
end
