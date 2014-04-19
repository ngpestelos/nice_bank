Before do
  puts "Go!"
end

After do |scenario|
  #save_and_open_page if scenario.failed?
  Sinatra::Application.cash_slot = CashSlot.new
end
