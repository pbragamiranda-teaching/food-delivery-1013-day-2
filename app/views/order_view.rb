class OrderView
  def display_orders(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. #{order.meal.name} to customer #{order.customer.name} delivered by #{order.employee.username}"
    end
  end

  def ask_for(stuff)
    puts "What is the #{stuff}"
    print ">"
    gets.chomp
  end

end
