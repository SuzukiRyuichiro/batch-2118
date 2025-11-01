require 'csv'
require_relative '../models/meal'


class MealRepository
  def initialize(csv_file_path)
    @meals = []
    @csv_file_path = csv_file_path
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    puts csv_file_path
    @meals
  end

  def create(meal) # Meal instance
    # Assign the ID to the meal
    meal.id = @next_id
    # increment the next id by 1
    @next_id += 1
    # Put the meal into the @meals array
    @meals << meal
    # save everything into CSV
    save_csv
  end

  def find(id) # integer
    @meals.find { |meal| meal.id == id }
  end

  private

  def load_csv
    # Parse the CSV file row by row
    CSV.foreach(@csv_file_path, headers: true, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      # each row, instantiate a meal
      meal = Meal.new(row)
      # put the meal instance into @meals array
      @meals << meal
    end
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def save_csv
    # Open the csv file blank
    CSV.open(@csv_file_path, 'wb') do |csv|
      # add the header row
      csv << %w[id name price]
      # iterate over the @meals array, insert row
      @meals.each do |meal| # meal is an instance of Meal
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
