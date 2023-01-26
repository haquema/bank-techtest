require 'balance'

RSpec.describe Balance do
  it "initialises" do
    balance = Balance.new(1000)
    expect(balance.display).to eq('Your balance is £1000.00')
  end
end
