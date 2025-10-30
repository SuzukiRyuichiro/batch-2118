require 'csv'

class Cookbook
  def initialize(csv_file_path)
    @recipes = [] # an array of Recipe instances
    @csv_file_path = csv_file_path
    load_csv
  end

  def create(recipe) # expect Recipe instance
    @recipes << recipe
    save_csv
  end

  def destroy(index)
    @recipes.delete_at(index)
    save_csv
  end

  def all
    @recipes
  end

  private

  def load_csv
    # open the csv file (parse)
    CSV.foreach(@csv_file_path) do |row|
      # go through each row
      # re-create Recipe instances out of each row
      # put the recipe into the @recipes array
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def save_csv
    # rewrite the CSV file to persist
    # erase the entire file
    CSV.open(@csv_file_path, 'wb') do |csv|
      # iterate over the @recipes array
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
      # on each iteration, write the name and description into a row
    end
  end
end
