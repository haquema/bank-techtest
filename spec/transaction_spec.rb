require "transaction"

RSpec.describe Transaction do
  context "upon initialisation" do
    it "stores transaction details correctly" do
      transaction = Transaction.new("credit", "01/01/2023", 1000)
      expect(transaction.type).to eq "credit"
      expect(transaction.date).to eq "01/01/2023"
      expect(transaction.amount).to eq 1000
    end
  end
end
