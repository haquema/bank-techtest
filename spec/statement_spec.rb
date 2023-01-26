require 'statement'





RSpec.describe Statement do
  describe "#transaction_balance" do
    it "returns the correct transactional balance after a single deposit" do
      fake_transaction = double(:fake_transaction, date: '01/01/2023', type: 'credit', amount: 300)
      fake_balance = double(:fake_balance, display: 300, transactions: [fake_transaction])
      statement = Statement.new(fake_balance)
      result = statement.transaction_balance(fake_transaction)
      expect(result).to eq(300)
    end
    
    it "returns the correct transactional balance after two deposits" do
      fake_transaction = double(:fake_transaction, date: '01/01/2023', type: 'credit', amount: 300)
      fake_transaction_2 = double(:fake_transaction_2, date: '02/01/2023', type: 'credit', amount: 300)
      fake_balance = double(:fake_balance, display: 600, transactions: [fake_transaction, fake_transaction_2])
      statement = Statement.new(fake_balance)
      result_1 = statement.transaction_balance(fake_transaction)
      result_2 = statement.transaction_balance(fake_transaction_2)
      expect(result_1).to eq(300)
      expect(result_2).to eq(600)
    end

    it "returns the correct transactional balance after three deposits" do
      fake_transaction = double(:fake_transaction, date: '01/01/2023', type: 'credit', amount: 300)
      fake_transaction_2 = double(:fake_transaction_2, date: '02/01/2023', type: 'credit', amount: 300)
      fake_transaction_3 = double(:fake_transaction_3, date: '03/01/2023', type: 'credit', amount: 300)
      fake_balance = double(:fake_balance, display: 900, transactions: [fake_transaction, fake_transaction_2, fake_transaction_3])
      statement = Statement.new(fake_balance)
      result_1 = statement.transaction_balance(fake_transaction)
      result_2 = statement.transaction_balance(fake_transaction_2)
      result_3 = statement.transaction_balance(fake_transaction_3)
      expect(result_1).to eq(300)
      expect(result_2).to eq(600)
      expect(result_3).to eq(900)
    end

    it "returns the correct transactional balance after a withdrawal" do
      fake_transaction = double(:fake_transaction, date: '01/01/2023', type: 'credit', amount: 300)
      fake_transaction_2 = double(:fake_transaction_2, date: '02/01/2023', type: 'debit', amount: 200)
      fake_balance = double(:fake_balance, display: 100, transactions: [fake_transaction, fake_transaction_2])
      statement = Statement.new(fake_balance)
      result_1 = statement.transaction_balance(fake_transaction)
      result_2 = statement.transaction_balance(fake_transaction_2)
      expect(result_1).to eq(300)
      expect(result_2).to eq(100)
    end

    it "returns the correct transactional balance after a series of mixed transactions" do
      fake_transaction = double(:fake_transaction, date: '01/01/2023', type: 'credit', amount: 500)
      fake_transaction_2 = double(:fake_transaction_2, date: '02/01/2023', type: 'debit', amount: 300)
      fake_transaction_3 = double(:fake_transaction_3, date: '03/01/2023', type: 'credit', amount: 600)
      fake_balance = double(:fake_balance, display: 800, transactions: [fake_transaction, fake_transaction_2, fake_transaction_3])
      statement = Statement.new(fake_balance)
      result_1 = statement.transaction_balance(fake_transaction)
      result_2 = statement.transaction_balance(fake_transaction_2)
      result_3 = statement.transaction_balance(fake_transaction_3)
      expect(result_1).to eq(500)
      expect(result_2).to eq(200)
      expect(result_3).to eq(800)
    end
  end
end