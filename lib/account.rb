class Account
  def initialize 
    @transactions = [] # set up an array to keep track of transactions
    @balance = 0 # set up an instance variable to keep track of the account balance
  end

  def deposit(date, amount)
    transaction = Transaction.new("credit", date, amount)
    @transactions << transaction
    @balance += transaction.amount 
  end

  # method will first check if withdraw request will take balance into negative
  # and return the error message if it is the case
  def withdraw(date, amount)
    raise error_message if (@balance - amount).negative? 
    transaction = Transaction.new("debit", date, amount)
    @transactions << transaction
    @balance -= transaction.amount
  end

  def print_statement
    return "There are no transactions to display" if @transactions.empty? 
    sorted = sort_transactions(@transactions)
    return statement_header + statement_generator(sorted)
  end









  private
  def error_message
    return "There isn't enough money in the account to process this withdrawal"
  end

  def statement_header
    return "date || credit || debit || balance"
  end

  def sort_transactions(transactions_array)
    transactions_array.sort_by(&:date).reverse
  end

  def statement_generator(sorted_transactions_array)
    statement = ""
    balance = @balance
    sorted_transactions_array.each do |transaction|
      statement += "\n#{transaction.format} #{balance}.00"
      if transaction.type == "credit" 
        balance -= transaction.amount
      else 
        balance += transaction.amount
      end
    end

    return statement
  end 

end