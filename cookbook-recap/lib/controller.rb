require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def add
    # ask user for name (view)
    name = @view.ask_user_for_name
    # ask user for description (view)
    description = @view.ask_user_for_description
    # make an instance of Recipe (model)
    recipe = Recipe.new(name, description)
    # save that into the cookbook (repository)
    @cookbook.create(recipe)
  end

  def remove
    # get all the recipes from the cookbook (repository)
    recipes_list = @cookbook.all
    # display the recipes in the cookbook (view)
    @view.display_list(recipes_list)
    # ask the user for a number to delete (view)
    index = @view.ask_user_for_index
    # ask the cookbook to destroy that recipe (repository)
    @cookbook.destroy(index)
  end

  def list
    # get all the recipes from the cookbook (repository)
    recipes_list = @cookbook.all
    # display the recipes nicely (view)
    @view.display_list(recipes_list)
  end
end
