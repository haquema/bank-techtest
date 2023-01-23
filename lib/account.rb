

class Account
  def initialize
    @transactions = []
    @transaction_no = 0
    @balance = 0
    @balance_record = {}
  end

  def deposit(date, amount)
    new_deposit = Transaction.new("credit", date, amount)
    @transactions << new_deposit
    @transaction_no += 1
    new_deposit.id=(@transaction_no)
    @balance += amount
    @balance_record[new_deposit.id] = @balance
  end

  def print_statement
    if @transactions.empty? 
      return "There's no transactions to display"
    else
      header = "date || credit || debit || balance"
      statement = ""
      @transactions.sort_by(&:date).reverse.each do |transaction|
        statement += "\n#{transaction.format} #{@balance_record[transaction.id]}.00"
      end
    end
    
    return header + statement
  end

  # private

  # def statement_header
  #   return "date || credit || debit || balance"
  # end

end