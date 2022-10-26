class MealView
  def display_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. Name: #{meal.name} | Price: $#{meal.price}"
    end
  end

  def ask_for(stuff)
    puts "What is the #{stuff}"
    print ">"
    gets.chomp
  end
end
