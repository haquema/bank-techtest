class Balance

  def initialize(starting_balance = 0)
    raise "Starting balance cannot be negative" if starting_balance.negative?
    @balance = starting_balance
    @transactions = []
  end

  def update(transaction)
    raise "This transaction will put you into overdraft!" if conditional(transaction)
    @balance += transaction.amount if transaction.type =='credit'
    @balance -= transaction.amount if transaction.type =='debit'
    update_transactions(transaction)
  end

  def transaction_balance(transaction)
    balance = @balance
    i = index(transaction)
    array = @transactions.reverse.slice(0...i)
    balance_modifier(array, balance)
  end

  def display
    return @balance
  end

  private

  def conditional(transaction)
    return (transaction.type == 'debit' && (@balance - transaction.amount).negative?)
  end

  def balance_modifier(array, balance)
    array.each do |transaction| 
      balance -= transaction.amount if transaction.type =='credit'
      balance += transaction.amount if transaction.type =='debit'
    end

    return balance
  end


  def index(transaction)
    @transactions.reverse.find_index(transaction)
  end

  def update_transactions(transaction)
    @transactions << transaction
    @transactions.sort_by(&:date)
  end
end
