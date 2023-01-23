class Transaction
  attr_reader :type, :date, :amount

  def initialize(type, date, amount)
    @type = type
    @date = date
    @amount = amount
  end
  
  def format
    return "#{@date} || #{@amount}.00 || || "
  end

end


# if @type == "credit"
#   return "#{@date} || #{amount} || || "
# else
#   return "#{@date} || ||  #{amount} || "
# end