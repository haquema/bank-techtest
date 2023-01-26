class Balance
  def initialize(starting_balance = 0)
    raise "Starting balance cannot be negative" if starting_balance.negative?
    @balance = starting_balance
  end

  def update(transaction)
    @balance += transaction.amount
  end

  def transaction_balance

  end

  def display
    return "Your balance is £#{@balance}.00"
  end
end
