require_relative "../views/customer_view.rb"
require_relative "../models/customer.rb"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customer_view = CustomerView.new
  end

  def add
    name = @customer_view.ask_for("name")
    address = @customer_view.ask_for("address")
    new_customer = Customer.new(name: name, address: address)
    @customer_repository.create(new_customer)
    list
  end

  def list
    customers = @customer_repository.all
    @customer_view.display_customers(customers)
  end
end
