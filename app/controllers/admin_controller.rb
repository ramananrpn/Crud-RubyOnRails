class AdminController < ApplicationController
  def index
  end

  # def new
  #   @account = Account.new
  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @account }
  #   end
  # end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(params[:account])
    @account.account_number = "AC" + (Time.now.to_i).to_s
    @account.balance = 2000
    respond_to do |format|

      if @account.save
        @details = @account
        puts "details : " + @details.account_number.to_s
        flash[:account_number] = "Account Number : " + (@account.account_number).to_s
        flash[:balance] = "Balance : " + (@account.balance).to_s
        format.html { redirect_to "/admin/index", notice: 'Account created Successfully'  }
        format.json { render json: @account, status: :created, location: @account }
      else
        format.html { render action: "new" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end

    end
  end

  def show
    @account = Account.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account }
    end
  end

  def list_users
    @accounts = Account.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transactions }
    end

  end

  # GET /transactions/new
  # GET /transactions/new.json
  def new
    @account = Transaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account }
    end
  end
end
