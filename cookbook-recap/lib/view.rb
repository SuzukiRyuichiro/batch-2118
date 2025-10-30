class View
  def ask_user_for_name
    puts "What is the name of the recipe??"
    gets.chomp
  end

  def ask_user_for_description
    puts "What is the description of the recipe??"
    gets.chomp
  end

  def display_list(recipes) # expect array of Recipe instances
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name}: #{recipe.description}"
    end
    # 1 - Gyudon: Rice and beef with sweet sauce
  end

  def ask_user_for_index
    puts "What is the number??"
    gets.chomp.to_i - 1
  end
end
