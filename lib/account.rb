class Account
  def initialize
    @transactions = []
    @balance = 0
  end

  def deposit(date, amount)
    transaction = Transaction.new("credit", date, amount)
    @transactions << transaction
    @balance += transaction.amount
  end

  def withdraw(date, amount)
    fail "You cannot withdraw when balance is zero!" unless @balance > 0
    transaction = Transaction.new("debit", date, amount)
    @transactions << transaction
    @balance -= transaction.amount
  end


  def print_statement
    if @transactions.empty? 
      return "There are no transactions to display"
    else
      sorted = sort_transactions(@transactions)
      return statement_header + statement_generator(sorted)
    end
  end









  private

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