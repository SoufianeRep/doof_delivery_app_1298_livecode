require_relative '../views/meals_view'
require_relative '../models/meal'

class MealsController
  def initialize(meals_repo)
    @meals_repo = meals_repo
    @view = MealsView.new
  end

  def add
    # ask the view for the name of the meal
    name = @view.ask_for("name")
    # ask the view for the price of the meal
    price = @view.ask_for("price").to_i
    # create an instance of a meal
    meal = Meal.new(name: name, price: price)
    # ask the repository to store the instance
    @meals_repo.create(meal)
    # display the list of meals
    display_meals
  end

  def list
    display_meals
  end

  private

  def display_meals
    # ask the repo for the list of meals
    meals = @meals_repo.all
    # pass it to the view to display it
    @view.display_meals(meals)
  end
end
