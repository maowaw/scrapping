require_relative '../lib/mairie_christmas'

describe "the get_townhall method" do
  it "should return twonhall, and townhall is not nil" do
    expect(get_townhall).not_to be_nil
  end
end