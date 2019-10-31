class ApplicationController < ActionController::Base
  include SessionsHelper

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
