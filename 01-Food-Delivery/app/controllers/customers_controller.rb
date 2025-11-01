require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def add
    # ask for the name
    name = @customers_view.ask_for('name')
    # ask for address
    address = @customers_view.ask_for('address')
    # make an instance of a customer
    customer = Customer.new(name: name, address: address)
    # create using the repository
    @customer_repository.create(customer)
  end

  def list
    # get all the customers (repository)
    customers = @customer_repository.all
    # display them nicely (view)
    @customers_view.display_list(customers)
  end
end
