require "account"
require "transaction"

RSpec.describe "integration" do
  context "with one deposit transaction recorded" do
    xit "prints a statement of that transaction in the desired format" do
      my_account = Account.new
      my_account.deposit("01/01/2023", 1000)
      result = my_account.print_statement
      expect(result).to eq "date || credit || debit || balance\n01/01/2023 || 1000.00 || || 1000.00"
    end
  end

end
