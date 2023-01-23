class Transaction
  attr_reader :type, :date, :amount

  def initialize(type, date, amount)
    @type = type
    @date = date
    @amount = amount
  end
  
  def format
    if @type == "credit"
      return "#{@date} || #{@amount}.00 || || "
    else
      return "#{@date} || || #{@amount}.00 || "
    end
  end

end