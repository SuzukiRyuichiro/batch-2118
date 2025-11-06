require 'csv'
require_relative '../models/order'

class OrderRepository
  def initialize(csv_file_path, meal_repository, customer_repository, employee_repository)
    @orders = []
    @csv_file_path = csv_file_path
    @next_id = 1
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    load_csv if File.exist?(@csv_file_path)
  end

  def create(order) # Order instance without an id
    # assign id
    order.id = @next_id
    # increment next id
    @next_id += 1
    # put it in the @orders array
    @orders << order
    # save csv
    save_csv
  end

  def undelivered_orders
    # filter out the delivered orders from @orders array
    @orders.reject(&:delivered?)
  end

  def mark_as_delivered(id)
    # Find the order to update with id
    order = @orders.find { |order| order.id == id }
    # Update the delivered state to true
    order.deliver!
    # save csv
    save_csv
  end

  private

  def save_csv
    # Open the CSV file
    CSV.open(@csv_file_path, 'wb') do |csv|
      # Add the header
      csv << %w[id meal_id customer_id employee_id delivered]
      # Iterate over the @orders array and insert into the row
      @orders.each do |order|
        csv << [order.id, order.meal.id, order.customer.id, order.employee.id, order.delivered?]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: true, header_converters: :symbol) do |row|
      # Convert id into integer
      row[:id] = row[:id].to_i
      # Convert delivered 'true' 'false' into boolean
      row[:delivered] = row[:delivered] == 'true'
      # Using meal_id find a meal instance with that id
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      # Using customer_id find a customer instance with that id
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      # Using employee_id find a employee instance with that id
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      @orders << Order.new(row)
    end
    @next_id = @orders.empty? ? 1 : @orders.last.id + 1
  end
end
