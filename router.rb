# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      display_menu
      option = gets.chomp.to_i
      action(option)
    end
  end

  private

  def display_menu
    puts "-------------------"
    puts "-------MENU--------"
    puts "-------------------"
    puts "What do you want to do?"
    puts "1 - Add a meal."
    puts "2 - list all the meals."
    puts "3 - Add a customer."
    puts "4 - list all the customers."
    puts "9 - Quit."
  end

  def action(option)
    case option
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 9 then stop
    end
  end

  def stop
    @running = false
  end
end
