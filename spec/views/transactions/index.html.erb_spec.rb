require 'spec_helper'

describe "transactions/index" do
  before(:each) do
    assign(:transactions, [
      stub_model(Transaction,
        :account_number => "Account Number",
        :transaction_type => "Transaction Type",
        :amount => 1,
        :balance => 2
      ),
      stub_model(Transaction,
        :account_number => "Account Number",
        :transaction_type => "Transaction Type",
        :amount => 1,
        :balance => 2
      )
    ])
  end

  it "renders a list of transactions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Account Number".to_s, :count => 2
    assert_select "tr>td", :text => "Transaction Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
