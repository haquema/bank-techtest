class Statement
  def initialize(balance)
    @balance = balance.display
    @transactions = balance.transactions
  end

  def transaction_balance(transaction)
    i = index(transaction)
    required_transactions = @transactions.reverse.slice(0...i)
    balance_modifier(required_transactions)
  end

  def generate
    statement = ""
    @transactions.each do |transaction|
      statement += "\n#{format(transaction)} #{transaction_balance(transaction)}"
    end

    print header + statement
  end

  

  private

  def balance_modifier(array)
    balance = @balance
    array.each do |transaction| 
      balance -= transaction.amount if transaction.type =='credit'
      balance += transaction.amount if transaction.type =='debit'
    end

    return balance
  end

  def index(transaction)
    @transactions.reverse.find_index(transaction)
  end

  def header
    return "date || credit || debit || balance"
  end

  def format(transaction)
    return "#{@date} || #{@amount}.00 || ||" if @type == "credit"
    return "#{@date} || || #{@amount}.00 ||" if @type == "debit"
  end

  def statement_generator(transactins)
    statement = ""
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
