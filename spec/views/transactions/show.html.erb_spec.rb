require 'spec_helper'

describe "transactions/show" do
  before(:each) do
    @transaction = assign(:transaction, stub_model(Transaction,
      :account_number => "Account Number",
      :transaction_type => "Transaction Type",
      :amount => 1,
      :balance => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Account Number/)
    rendered.should match(/Transaction Type/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
