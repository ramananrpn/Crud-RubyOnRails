class SessionsController < ApplicationController
  before_filter :require_login , except: [:new , :create ,:destroy]

  def new
  end

  def create
    account = Account.find_by_account_number(params[:account_number])
    puts "Account Number - #{params[:account_number]}"
    if account && account.password == params[:password]
      session[:account_number] = account.account_number
      case account.account_number
      when "admin"
        redirect_to admin_index_url
      else
      redirect_to user_index_url
      end
    else
      flash[:error] = "Invalid Account Number / Password"
      redirect_to welcome_index_url
    end

  end

  def destroy
    session[:account_number] = nil
    redirect_to welcome_index_url, notice: "Successfully Signed Out!!"
  end
end
