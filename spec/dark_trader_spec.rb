require_relative '../lib/dark_trader'

describe "the recup_symbols method" do
  it "should return symbol, and symbol is not nil" do
    expect(recup_symnols).not_to be_nil
  end
end