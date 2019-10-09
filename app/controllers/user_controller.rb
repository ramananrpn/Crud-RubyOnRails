class UserController < ApplicationController
  before_filter :user?

  def index
      @account = current_user
  end

  def deposit
  end

  def transfer
  end

  def withdraw
  end

  def update_deposit
    @account = Account.find_by_account_number(current_user.account_number)

    respond_to do |format|
      if @account.update_attribute(:balance , @account.balance.to_i + params[:deposit_amount].to_i)
        flash[:success] = "Deposited Successfully!!"
      else
        flash[:error] = "Operation Failed. Please Try Again."
      end
      format.html { redirect_to user_index_url }
      format.json { head :no_content }
    end
  end

  def update_withdraw
    @account = Account.find_by_account_number(current_user.account_number)
    if @account.balance - params[:withdraw_amount].to_i >= 1000
      respond_to do |format|
        if @account.update_attribute(:balance , @account.balance.to_i + params[:withdraw_amount].to_i)
          flash[:success] = "Deposited Successfully!!"
        else
          flash[:error] = "Operation Failed. Please Try Again."
        end
        format.html { redirect_to user_index_url }
        format.json { head :no_content }
      end
    else

    end

  end

  private
  def user?
    unless current_user.role == 0
      flash[:error] = "Access Denied - You are not an Valid User : Please SignIn"
      # render :action => 'sessions/destroy'
      redirect_to welcome_index_url
    end
  end
end
