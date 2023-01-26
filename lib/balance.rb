class Balance

  def initialize(starting_balance = 0)
    raise "Starting balance cannot be negative" if starting_balance.negative?
    @balance = starting_balance
  end

  def update(transaction)
    raise "This transaction will put you into overdraft!" if conditional(transaction)
    @balance += transaction.amount if transaction.type =='credit'
    @balance -= transaction.amount if transaction.type =='debit'
  end

  def transaction_balance(transaction)
    return @balance
  end

  def display
    return @balance
  end

  private

  def conditional(transaction)
    return (transaction.type == 'debit' && (@balance - transaction.amount).negative?)
  end
end
