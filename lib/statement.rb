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
end
