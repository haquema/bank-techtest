require "./lib/account"
require "./lib/transaction"

this_account = Account.new

puts "Do you need any banking services? y/n"
input = gets.chomp.downcase

while input == "y" do 

  puts "Would you like to deposit, withdraw or print your statement?"
  request = gets.chomp.downcase

  if request.include?("deposit")
    puts "How much do you want to deposit?"
    amount = gets.chomp.to_i
    puts "What date should this transaction be made? enter date using dd/mm/yyyy format"
    date = gets.chomp
    this_account.deposit(date, amount)
  elsif request.include?("withdraw")
    puts "How much do you want to withdraw?"
    amount = gets.chomp.to_i
    puts "What date should this transaction be made? enter date using dd/mm/yyyy format"
    date = gets.chomp
    this_account.withdraw(date, amount)
  elsif request.include?("print") || input.include?("statement")
    puts this_account.print_statement
  else
    puts "I don't recognise that, please try again"
  end

  puts "Do you need any further services? y/n"
  input = gets.chomp.downcase
end

puts "Thank you!"