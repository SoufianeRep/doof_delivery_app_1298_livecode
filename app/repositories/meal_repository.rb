require 'csv'

class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @meals = [] # array of instances
    @next_id = 1
    load_csv
  end

  def create(meal)
    meal.id = @next_id
    @meals << meal
    @next_id += 1
    save_csv
  end

  def all
    @meals
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
    @next_id = @meals.last.id + 1 unless @meals.empty?
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << ["id", "name", "price"]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
