class MealsView
  def ask_for(thing)
    puts "Whats is the name of the #{thing} you want to create?"
    return gets.chomp
  end

  def display_meals(meals)
    meals.each do |meal|
      puts "#{meal.name} | $#{meal.price}"
    end
  end
end
