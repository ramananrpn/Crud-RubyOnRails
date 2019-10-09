class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session ,if: Proc.new { |c| c.request.format == 'application/json' }

  private

  before_filter :require_login

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to welcome_index_path # halts request cycle
      return
    end

  end

  private

  def current_user
    @current_user ||= Account.find_by_account_number(session[:account_number]) if session[:account_number]
  end

  helper_method :current_user









end
