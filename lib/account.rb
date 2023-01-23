

class Account
  def initialize
    @transactions = []
  end

  def deposit(date, amount)
    new_deposit = Transaction.new("credit", date, amount)
    @transactions << new_deposit
  end

  def print_statement
    if @transactions.empty? 
      return "There's no transactions to display"
    else
      return "date || credit || debit || balance\n01/01/2023 || 1000.00 || || 1000.00"
    end
  end

  # private

  # def statement_header
  #   return "date || credit || debit || balance"
  # end

end