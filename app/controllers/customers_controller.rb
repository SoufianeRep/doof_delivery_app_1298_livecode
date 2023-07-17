require_relative '../views/customers_view'
require_relative '../models/customer'

class CustomersController
  def initialize(customer_repo)
    @customer_repo = customer_repo
    @view = CustomersView.new
  end

  def add
    # ask the view for the name of the meal
    name = @view.ask_for("name")
    # ask the view for the price of the meal
    address = @view.ask_for("address")
    # create an instance of a meal
    customer = Customer.new(name: name, address: address)
    # ask the repository to store the instance
    @customer_repo.create(customer)
    # display customers
    display_customers
  end

  def list
    display_customers
  end

  private

  def display_customers
    # ask the repo for the list of meals
    customers = @customer_repo.all
    # pass it to the view to display it
    @view.display_customers(customers)
  end
end
