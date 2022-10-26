require 'csv'

class MealRepository

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @meals = []
    @next_id = 1
    # when instanciating a new MealRepository, check CSV and load meals
    load_csv if File.exist?(@csv_file_path)
  end

  def create(new_meal)
    # set the right id to new_meal
    new_meal.id = @next_id
    # push new_meal into local-memory (@meals)
    @meals << new_meal
    # increment the next id
    @next_id += 1
    # save local changes to csv
    save_csv
  end

  def all
    @meals
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
    # @meals.find do |meal|
    #   meal.id == id
    # end
  end

  private

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << ["id", "name", "price"]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end


  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      # row => #<CSV::Row id:"1" name:"falafel" price:"4">
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end
end
