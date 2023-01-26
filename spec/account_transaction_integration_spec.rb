require "account"
require "transaction"

header = 'date || credit || debit || balance'

RSpec.describe "integration" do
  context "when one deposit transaction recorded" do
    xit "prints a statement of that transaction in the desired format" do
      line_1 = '01/01/2023 || 1000.00 || || 1000.00'
      my_account = Account.new
      my_account.deposit("01/01/2023", 1000)
      expectation = expect { my_account.print_statement } 
      expectation.to output(include(header, line_1)).to_stdout
    end
  end

  context "when two deposit transactions recorded" do
    xit "prints a statement of that transaction in the desired format" do
      line_1 = '04/01/2023 || 2000.00 || || 3000.00'
      line_2 = '01/01/2023 || 1000.00 || || 1000.00'
      my_account = Account.new
      my_account.deposit("01/01/2023", 1000)
      my_account.deposit("04/01/2023", 2000)
      expectation = expect { my_account.print_statement }      
      expectation.to output(include(header, line_1, line_2)).to_stdout
    end
  end

  context "when three unordered deposit transactions recorded" do
    xit "prints a statement of that transaction in the desired format" do 
      line_1 = "04/01/2023 || 2000.00 || || 3500.00"
      line_2 = "02/01/2023 || 500.00 || || 1500.00"
      line_3 = "01/01/2023 || 1000.00 || || 1000.00"
      my_account = Account.new
      my_account.deposit("04/01/2023", 2000)
      my_account.deposit("01/01/2023", 1000)
      my_account.deposit("02/01/2023", 500)
      expectation = expect { my_account.print_statement }      
      expectation.to output(include(header, line_1, line_2, line_3)).to_stdout
    end
  end
  
  context "when deposit and withdrawal transactions recorded" do
    xit "prints a statement of that transaction in the desired format" do
      line_1 ="04/01/2023 || || 500.00 || 500.00"
      line_2 = "01/01/2023 || 1000.00 || || 1000.00"
      my_account = Account.new
      my_account.deposit("01/01/2023", 1000)
      my_account.withdraw("04/01/2023", 500)
      expectation = expect { my_account.print_statement }      
      expectation.to output(include(header, line_1, line_2)).to_stdout
    end
  end

  context "when three unordered deposit and withdrawal transactions recorded" do
    xit "prints a statement of that transaction in the desired format" do
      expected = "date || credit || debit || balance" 
      line_1 = "06/01/2023 || || 1000.00 || 0.00" 
      line_2 = "04/01/2023 || || 500.00 || 1000.00" 
      line_3 = "01/01/2023 || 1500.00 || || 1500.00"
      my_account = Account.new
      my_account.deposit("01/01/2023", 1500)
      my_account.withdraw("06/01/2023", 1000)
      my_account.withdraw("04/01/2023", 500)
      expectation = expect { my_account.print_statement }      
      expectation.to output(include(header, line_1, line_2, line_3)).to_stdout
    end
  end

  context "when four unordered deposit and withdrawal transactions recorded" do
    xit "prints a statement of that transaction in the desired format" do
      expected = "date || credit || debit || balance" 
      line_1 = "06/01/2023 || || 1000.00 || 1000.00"
      line_2 = "04/01/2023 || || 500.00 || 2000.00" 
      line_3 = "02/01/2023 || 1000.00 || || 2500.00" 
      line_4 = "01/01/2023 || 1500.00 || || 1500.00"
      my_account = Account.new
      my_account.deposit("01/01/2023", 1500)
      my_account.withdraw("06/01/2023", 1000)
      my_account.withdraw("04/01/2023", 500)
      my_account.deposit("02/01/2023", 1000)
      expectation = expect { my_account.print_statement }      
      expectation.to output(include(header, line_1, line_2, line_3, line_4)).to_stdout
    end
  end

  context "when balance is zero withdrawal transaction is recorded" do
    xit "fails and returns appropriate error message" do
      error_message = "There isn't enough money in the account to process this withdrawal"
      my_account = Account.new
      expect { my_account.withdraw("04/01/2023", 1000) }.to raise_error error_message
    end
  end

  context "when attempting to withdraw more money than in the account" do
    xit "fails and returns an error message" do
      error_message = "There isn't enough money in the account to process this withdrawal"
      my_account = Account.new
      my_account.deposit("01/01/2023", 500)
      expect { my_account.withdraw("04/01/2023", 600) }.to raise_error error_message
    end
  end
end