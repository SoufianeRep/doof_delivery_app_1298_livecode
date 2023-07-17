class CustomersView
  def ask_for(thing)
    puts "Whats is the #{thing} of the customer you want to create?"
    return gets.chomp
  end

  def display_customers(customers)
    customers.each do |customer|
      puts "#{customer.name} | address :#{customer.address}"
    end
  end
end
