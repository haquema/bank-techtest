class Balance
  def initialize(starting_balance = 0)
    raise "Starting balance cannot be negative" if starting_balance.negative?
    @balance = starting_balance
  end

  def update(transaction)
    bool = (transaction.type == 'debit' && (@balance - transaction.amount).negative?)
    raise "This transaction will put you into overdraft!" if bool
    @balance += transaction.amount if transaction.type =='credit'
    @balance -= transaction.amount if transaction.type =='debit'
  end

  def transaction_balance

  end

  def display
    return "Your balance is £#{@balance}.00"
  end
end
