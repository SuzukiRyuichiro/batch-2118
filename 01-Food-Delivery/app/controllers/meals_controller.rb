require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def add
    # ask user for name (view)
    name = @meals_view.ask_for_name
    # ask user for price  (view)
    price = @meals_view.ask_for_price
    # make an instance of a meal (model)
    meal = Meal.new(name: name, price: price)
    # create the meal using the repository (repo)
    @meal_repository.create(meal)
  end

  def list
    # get all the meals from the repository (repo)
    meals = @meal_repository.all
    # tell the view to display all meals nicely (view)
    @meals_view.display_list(meals)
  end
end
