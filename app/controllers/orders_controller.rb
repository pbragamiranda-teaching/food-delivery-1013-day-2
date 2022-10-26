require_relative "../views/meal_view.rb"
require_relative "../views/customer_view.rb"
require_relative "../views/employee_view.rb"
require_relative "../views/order_view.rb"

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @order_repository =order_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @meal_view = MealView.new
    @order_view = OrderView.new
    @customer_view = CustomerView.new
    @employee_view = EmployeeView.new
  end

  def add
    # display and ask the user which meal for the order
    meal = select_meal
    # display and ask the user which customer for the order
    customer = select_customer
    # display ask the user which employee for the order
    employee = select_employee
    # create new order
    new_order = Order.new(meal: meal, customer: customer, employee: employee)
    # ask the repo to save the order
    @order_repository.create(new_order)
    # display all orders
    list_undelivered_orders
  end

  def mark_as_delivered(rider)
    # list all my orders
    order = list_my_orders(rider)
    # ask for which one to mark
    @order_view.display_orders(order)
    # fecth the right one
    user_index = @order_view.ask_for("index").to_i
    # mark as delived
    order = order[user_index - 1]
    @order_repository.mark_order_as_delivered(order)
  end

  def list_my_orders(rider)
    orders = @order_repository.undelivered_orders
    my_undelivered_orders = orders.select do |order|
      order.employee.id == rider.id
    end
    @order_view.display_orders(my_undelivered_orders)
    my_undelivered_orders
  end

  def list_undelivered_orders
    @order_view.display_orders(@order_repository.undelivered_orders)
  end

  def select_employee
    employees = @employee_repository.all_riders
    @employee_view.display_employees(employees)
    user_index = @employee_view.ask_for("index").to_i
    employees[user_index - 1]
  end

  def select_customer
    customers = @customer_repository.all
    @customer_view.display_customers(customers)
    user_index = @customer_view.ask_for("index").to_i
    customers[user_index - 1]
  end

  def select_meal
    # fetch all meals from repo
    meals = @meal_repository.all
    # display all the meals
    @meal_view.display_meals(meals)
    # ask which one he/she wants
    user_index = @meal_view.ask_for("index").to_i
    # fetch the right meal from meals array
    meals[user_index - 1]
  end


end
