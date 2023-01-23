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
      statement = ""
      balance = @balance
      sorted = sort_transactions(@transactions)
      sorted.each do |transaction|
        statement += "\n#{transaction.format} #{balance}.00"
        balance -= transaction.amount
      end

      return statement_header + statement
    end
  end

  private

  def statement_header
    return "date || credit || debit || balance"
  end

  def sort_transactions(array)
    array.sort_by(&:date).reverse
  end
      

end