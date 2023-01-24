require "account"
require "transaction"

RSpec.describe "integration" do
  context "when one deposit transaction recorded" do
    it "prints a statement of that transaction in the desired format" do
      my_account = Account.new
      my_account.deposit("01/01/2023", 1000)
      result = my_account.print_statement
      expect(result).to eq "date || credit || debit || balance\n01/01/2023 || 1000.00 || || 1000.00"
    end
  end

  context "when two deposit transactions recorded" do
    it "prints a statement of that transaction in the desired format" do
      expected = "date || credit || debit || balance" + 
                 "\n04/01/2023 || 2000.00 || || 3000.00" +
                 "\n01/01/2023 || 1000.00 || || 1000.00"
      my_account = Account.new
      my_account.deposit("01/01/2023", 1000)
      my_account.deposit("04/01/2023", 2000)
      result = my_account.print_statement
      expect(result).to eq expected
    end
  end

  context "when three unordered deposit transactions recorded" do
    it "prints a statement of that transaction in the desired format" do
      expected = "date || credit || debit || balance" + 
                 "\n04/01/2023 || 2000.00 || || 3500.00" +
                 "\n02/01/2023 || 500.00 || || 1500.00" +
                 "\n01/01/2023 || 1000.00 || || 1000.00"
      my_account = Account.new
      my_account.deposit("04/01/2023", 2000)
      my_account.deposit("01/01/2023", 1000)
      my_account.deposit("02/01/2023", 500)
      result = my_account.print_statement
      expect(result).to eq expected
    end
  end
  
  context "when deposit and withdrawal transactions recorded" do
    it "prints a statement of that transaction in the desired format" do
      expected = "date || credit || debit || balance" + 
                 "\n04/01/2023 || || 500.00 || 500.00" +
                 "\n01/01/2023 || 1000.00 || || 1000.00"
      my_account = Account.new
      my_account.deposit("01/01/2023", 1000)
      my_account.withdraw("04/01/2023", 500)
      result = my_account.print_statement
      expect(result).to eq expected
    end
  end

  context "when three unordered deposit and withdrawal transactions recorded" do
    it "prints a statement of that transaction in the desired format" do
      expected = "date || credit || debit || balance" + 
                 "\n06/01/2023 || || 1000.00 || 0.00" +
                 "\n04/01/2023 || || 500.00 || 1000.00" +
                 "\n01/01/2023 || 1500.00 || || 1500.00"
      my_account = Account.new
      my_account.deposit("01/01/2023", 1500)
      my_account.withdraw("06/01/2023", 1000)
      my_account.withdraw("04/01/2023", 500)
      result = my_account.print_statement
      expect(result).to eq expected
    end
  end

  context "when four unordered deposit and withdrawal transactions recorded" do
    it "prints a statement of that transaction in the desired format" do
      expected = "date || credit || debit || balance" + 
                 "\n06/01/2023 || || 1000.00 || 1000.00" +
                 "\n04/01/2023 || || 500.00 || 2000.00" +
                 "\n02/01/2023 || 1000.00 || || 2500.00" +
                 "\n01/01/2023 || 1500.00 || || 1500.00"
      my_account = Account.new
      my_account.deposit("01/01/2023", 1500)
      my_account.withdraw("06/01/2023", 1000)
      my_account.withdraw("04/01/2023", 500)
      my_account.deposit("02/01/2023", 1000)
      result = my_account.print_statement
      expect(result).to eq expected
    end
  end

  context "when balance is zero withdrawal transaction is recorded" do
    it "fails and returns appropriate error message" do
      error_message = "There isn't enough money in the account to process this withdrawal"
      my_account = Account.new
      expect { my_account.withdraw("04/01/2023", 1000) }.to raise_error error_message
    end
  end

  context "when attempting to withdraw more money than in the account" do
    it "fails and returns an error message" do
      error_message = "There isn't enough money in the account to process this withdrawal"
      my_account = Account.new
      my_account.deposit("01/01/2023", 500)
      expect { my_account.withdraw("04/01/2023", 600) }.to raise_error error_message
    end
  end
end