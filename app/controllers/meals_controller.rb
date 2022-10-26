require_relative "../views/meal_view"
require_relative "../models/meal"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meal_view = MealView.new
  end

  def add
    # ask user for name
    name = @meal_view.ask_for("name")
    # ask user for price
    price = @meal_view.ask_for("price")
    # create new instance of Meal
    new_meal = Meal.new(name: name, price: price.to_i)
    # ask repo to store new meal
    @meal_repository.create(new_meal)
    # list so the user can see that it worked
    list
  end

  def list
    # fetch the meals from repository
    meals = @meal_repository.all
    # ask view to display the meals
    @meal_view.display_meals(meals)
  end
end
