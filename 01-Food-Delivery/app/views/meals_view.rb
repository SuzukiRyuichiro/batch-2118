class MealsView
  def ask_for_name
    puts "Please provide a name of the meal"
    gets.chomp
  end

  def ask_for_price
    puts "Please provide the price of the meal"
    gets.chomp.to_i
  end

  def display_list(meals) # Array of meal instances
    meals.each_with_index do |meal, index|
      puts "#{index + 1} - #{meal.name}: ¥#{meal.price}"
    end
  end
end
