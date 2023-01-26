require 'balance'

RSpec.describe Balance do
  context "upon initialisation" do
    it "returns displays balance correctly when given a positive starting balance" do
      balance = Balance.new(1000)
      expect(balance.display).to eq(1000)
    end

    it "returns a zero balance when no argument is given" do
      balance = Balance.new
      expect(balance.display).to eq(0)
    end

    it "fails when given a negative starting balance" do
      expect { balance = Balance.new(-100) }.to raise_error "Starting balance cannot be negative"
    end
  end

  describe '#update' do
    context "when given a deposit transaction" do
      it "updates balance correctly with a given amount" do
        balance = Balance.new
        fake_transaction = double(:fake_transaction, date: '01/01/2023', type: 'credit', amount: 100)
        balance.update(fake_transaction)
        expected = balance.display
        expect(expected).to eq(100)
      end

      it "updates balance correctly for a different value transaction" do
        balance = Balance.new
        fake_transaction = double(:fake_transaction, date: '01/01/2023', type: 'credit', amount: 200)
        balance.update(fake_transaction)
        expected = balance.display
        expect(expected).to eq(200)
      end
    end

    context "when given multiple deposit transactions" do
      it "updates balance correctly" do
        balance = Balance.new
        fake_transaction = double(:fake_transaction, date: '01/01/2023', type: 'credit', amount: 200)
        fake_transaction_2 = double(:fake_transaction_2, date: '02/01/2023', type: 'credit', amount: 300)
        balance.update(fake_transaction)
        balance.update(fake_transaction_2)
        expected = balance.display
        expect(expected).to eq(500)
      end
    end

    context "when given a withdrawal transaction" do
      it "updates balance correctly with amount" do
        balance = Balance.new
        fake_transaction = double(:fake_transaction, date: '01/01/2023', type: 'credit', amount: 300)
        fake_transaction_2 = double(:fake_transaction_2, date: '02/01/2023', type: 'debit', amount: 200)
        balance.update(fake_transaction)
        balance.update(fake_transaction_2)
        expected = balance.display
        expect(expected).to eq(100)
      end
    end

    context "when given a a mixture of transactions" do
      it "updates balance correctly" do
        balance = Balance.new
        fake_transaction = double(:fake_transaction, date: '01/01/2023', type: 'credit', amount: 300)
        fake_transaction_2 = double(:fake_transaction_2, date: '02/01/2023', type: 'debit', amount: 200)
        fake_transaction_3 = double(:fake_transaction_2, date: '03/01/2023', type: 'credit', amount: 400)
        balance.update(fake_transaction)
        balance.update(fake_transaction_2)
        balance.update(fake_transaction_3)
        expected = balance.display
        expect(expected).to eq(500)
      end
    end    

    context "when a withdrawal will take balance in to negative" do
      it "fails and returns appropriate error message" do
        balance = Balance.new
        fake_transaction = double(:fake_transaction, date: '01/01/2023', type: 'credit', amount: 300)
        fake_transaction_2 = double(:fake_transaction_2, date: '02/01/2023', type: 'debit', amount: 350)
        balance.update(fake_transaction)
        expect { balance.update(fake_transaction_2) }.to raise_error "This transaction will put you into overdraft!"
      end
    end    
  end

  describe "#transaction_balance" do
    context "when recording deposits" do
      it "returns the correct transactional balance after a single deposit" do
        balance = Balance.new
        fake_transaction = double(:fake_transaction, date: '01/01/2023', type: 'credit', amount: 300)
        balance.update(fake_transaction)
        result = balance.transaction_balance(fake_transaction)
        expect(result).to eq(300)
      end
      
      it "returns the correct transactional balance after two deposits" do
        balance = Balance.new
        fake_transaction = double(:fake_transaction, date: '01/01/2023', type: 'credit', amount: 300)
        fake_transaction_2 = double(:fake_transaction_2, date: '02/01/2023', type: 'credit', amount: 300)
        balance.update(fake_transaction)
        balance.update(fake_transaction_2)
        result_1 = balance.transaction_balance(fake_transaction)
        result_2 = balance.transaction_balance(fake_transaction_2)
        expect(result_1).to eq(300)
        expect(result_2).to eq(600)
      end

      it "returns the correct transactional balance after three deposits" do
        balance = Balance.new
        fake_transaction = double(:fake_transaction, date: '01/01/2023', type: 'credit', amount: 300)
        fake_transaction_2 = double(:fake_transaction_2, date: '02/01/2023', type: 'credit', amount: 300)
        fake_transaction_3 = double(:fake_transaction_3, date: '03/01/2023', type: 'credit', amount: 300)
        balance.update(fake_transaction)
        balance.update(fake_transaction_2)
        balance.update(fake_transaction_3)
        result_1 = balance.transaction_balance(fake_transaction)
        result_2 = balance.transaction_balance(fake_transaction_2)
        result_3 = balance.transaction_balance(fake_transaction_3)
        expect(result_1).to eq(300)
        expect(result_2).to eq(600)
        expect(result_3).to eq(900)
      end
    end
  end

end
