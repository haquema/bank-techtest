class Transaction
  attr_accessor :type, :date, :amount, :id
  

  def initialize(type, date, amount)
    @type = type
    @date = date
    @amount = amount
    @id = nil
  end

end