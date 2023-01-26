class Balance
  def initialize(starting_balance = 0)
    @balance = starting_balance
  end

  def display
    return "Your balance is £#{@balance}.00"
  end
end
