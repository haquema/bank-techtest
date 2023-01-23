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

  def print_statement
    if @transactions.empty? 
      return "There's no transactions to display"
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
      balance -= transaction.amount
    end

    return statement
  end 

end