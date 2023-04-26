class ApplicationController < ActionController::Base
  include SessionsHelper


  private
  def authenticate
    unless logged_in?
      flash[:danger] = "thank you for connecting"
      redirect_to login_path
    end
  end
end
