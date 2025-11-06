require_relative '../views/meals_view'
require_relative '../views/customers_view'
require_relative '../views/employees_view'
require_relative '../views/orders_view'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository

    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @employees_view = EmployeesView.new
    @orders_view = OrdersView.new
  end

  def add
    # get all meal instances (repo)
    meals = @meal_repository.all
    # display all meals (meals view)
    @meals_view.display(meals)
    # ask which meal (orders view)
    meal_index = @orders_view.ask_for_index
    meal = meals[meal_index]

    # get all customer instances (repo)
    customers = @customer_repository.all
    # display all customers
    @customers_view.display(customers)
    # ask which customer
    customer_index = @orders_view.ask_for_index
    # display all riders
    customer = customers[customer_index]
    # ask which rider

    riders = @employee_repository.all_riders
    @employees_view.display(riders)
    rider_index = @orders_view.ask_for_index
    rider = riders[rider_index] # Employee instance

    # instantiate a new Order
    order = Order.new(meal: meal, customer: customer, employee: rider)
    # ask the order repository to create and save
    @order_repository.create(order)
  end

  def list_undelivered_orders
    # Get all undelivered order instances from repository
    orders = @order_repository.undelivered_orders
    # Display them nicely (view)
    @orders_view.display(orders)
  end

  def list_my_orders(employee)
    orders = @order_repository.undelivered_orders
    # Filter them by employee
    my_orders = orders.select { |order| order.employee == employee }
    @orders_view.display(my_orders)
  end

  def mark_as_delivered(employee)
    orders = @order_repository.undelivered_orders
    # Filter them by employee
    my_orders = orders.select { |order| order.employee == employee }
    @orders_view.display(my_orders)

    # Ask which order to mark as delivered (view)
    index = @orders_view.ask_for_index
    order_to_update = orders[index]
    @order_repository.mark_as_delivered(order_to_update.id)
  end
end
