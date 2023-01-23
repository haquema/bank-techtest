require "account"

RSpec.describe Account do
  context "upon initialisation" do
    it "returns an empty list of transactions" do
      my_account = Account.new
      result = my_account.print_statement
      expect(result).to eq "There's no transactions to display"
    end
  end

end