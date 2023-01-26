require 'balance'

RSpec.describe Balance do
  context "upon initialisation" do
    it "returns displays balance correctly when given a positive starting balance" do
      balance = Balance.new(1000)
      expect(balance.display).to eq('Your balance is £1000.00')
    end

    it "returns a zero balance when no argument is given" do
      balance = Balance.new
      expect(balance.display).to eq('Your balance is £0.00')
    end
  end
end
