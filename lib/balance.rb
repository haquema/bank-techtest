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

  def display
    return @balance
  end

  

  private

  def conditional(transaction)
    return (transaction.type == 'debit' && (@balance - transaction.amount).negative?)
  end

  def update_transactions(transaction)
    @transactions << transaction
    @transactions.sort_by(&:date)
  end
end
