require 'csv'
require_relative '../models/customer'


class CustomerRepository
  def initialize(csv_file_path)
    @customers = []
    @csv_file_path = csv_file_path
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    @customers
  end

  def create(customer) # customer instance
    # Assign the ID to the customer
    customer.id = @next_id
    # increment the next id by 1
    @next_id += 1
    # Put the customer into the @customers array
    @customers << customer
    # save everything into CSV
    save_csv
  end

  def find(id) # integer
    @customers.find { |customer| customer.id == id }
  end

  private

  def load_csv
    # Parse the CSV file row by row
    CSV.foreach(@csv_file_path, headers: true, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      # each row, instantiate a customer
      customer = Customer.new(row)
      # put the customer instance into @customers array
      @customers << customer
    end
    @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end

  def save_csv
    # Open the csv file blank
    CSV.open(@csv_file_path, 'wb') do |csv|
      # add the header row
      csv << %w[id name address]
      # iterate over the @customers array, insert row
      @customers.each do |customer| # customer is an instance of customer
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end
