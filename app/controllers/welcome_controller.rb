class WelcomeController < ApplicationController
  before_filter :require_login , except: [:index]

  def index
    if current_user
      case current_user.account_number
      when "admin"
        redirect_to admin_index_url
      else
        redirect_to user_index_url
      end
    end
  end

end
