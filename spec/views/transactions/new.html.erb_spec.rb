require 'spec_helper'

describe "transactions/new" do
  before(:each) do
    assign(:transaction, stub_model(Transaction,
      :account_number => "MyString",
      :transaction_type => "MyString",
      :amount => 1,
      :balance => 1
    ).as_new_record)
  end

  it "renders new transaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => transactions_path, :method => "post" do
      assert_select "input#transaction_account_number", :name => "transaction[account_number]"
      assert_select "input#transaction_transaction_type", :name => "transaction[transaction_type]"
      assert_select "input#transaction_amount", :name => "transaction[amount]"
      assert_select "input#transaction_balance", :name => "transaction[balance]"
    end
  end
end
