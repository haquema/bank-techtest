class Transaction
  attr_accessor :type, :date, :amount, :id
  

  def initialize(type, date, amount)
    @type = type
    @date = date
    @amount = amount
    @id = nil
  end
  
  def format
    if @type == "credit"
      return "#{@date} || #{@amount}.00 || ||"
    else
      return "#{@date} || || #{@amount}.00 ||"
    end
  end

end