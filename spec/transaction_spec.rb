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

  context "when the format method is called on a given credit transaction" do
    it "returns a string in the expected format for a statement" do
      transaction = Transaction.new("credit", "01/01/2023", 1000)
      result = transaction.format
      expect(result).to eq "01/01/2023 || 1000.00 || ||"
    end
  end

  context "when the format method is called on a different credit transaction" do
    it "returns a string in the expected format for a statement" do
      transaction = Transaction.new("credit", "02/01/2023", 2000)
      result = transaction.format
      expect(result).to eq "02/01/2023 || 2000.00 || ||"
    end
  end

  context "when the format method is called on a debit transaction" do
    it "returns a string in the expected format for a statement" do
      transaction = Transaction.new("debit", "01/01/2023", 1000)
      result = transaction.format
      expect(result).to eq "01/01/2023 || || 1000.00 ||"
    end
  end

end
