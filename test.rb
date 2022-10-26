# row => #<CSV::Row id:"1" name:"falafel" price:"4">

Meal.new(id: row[:id].to_i , name: row[:name] ,price: row[:price].to_i )

Meal.new(row)



# row => #<CSV::Row id:"1" delivered:"false" meal_id:"2" customer_id:"1" employee_id:"2">

CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
  row[:id] = row[:id].to_i
  row[:meal] = @meal_repository.find(row[:meal_id].to_i)
  row[:customer] = @customer_repository.find(row[:customer_id].to_i)
  row[:employee] = @employee_repository.find(row[:employee_id].to_i)
  row[:delivered] = row[:delivered] == "true"
  # @orders << Order.new(id: id, meal: meal, customer: customer,
  #                   employee: employee, delivered: delivered)
  @orders << Order.new(row)
end
