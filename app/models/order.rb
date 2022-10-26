class Order
  attr_accessor :id
  attr_reader :meal, :customer, :employee

  def initialize(attr = {})
    @id = attr[:id] # Integer
    @meal = attr[:meal] # instance of Meal
    @customer = attr[:customer] # instance of Customer
    @employee= attr[:employee] # instance of Employee
    @delivered = attr[:delivered] || false # Boolean
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

end
