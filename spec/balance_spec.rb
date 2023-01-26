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

    it "fails when given a negative starting balance" do
      expect { balance = Balance.new(-100) }.to raise_error "Starting balance cannot be negative"
    end
  end

  describe '#update' do
    context "when given a deposit transaction" do
      it "updates balance correctly with a given amount" do
        balance = Balance.new
        fake_transaction = double(:fake_transaction, amount: 100)
        balance.update(fake_transaction)
        expected = balance.display
        expect(expected).to eq('Your balance is £100.00')
      end

      it "updates balance correctly with another amount" do
        balance = Balance.new
        fake_transaction = double(:fake_transaction, amount: 200)
        balance.update(fake_transaction)
        expected = balance.display
        expect(expected).to eq('Your balance is £200.00')
      end
    end
  end
end
