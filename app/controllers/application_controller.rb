class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
      if Current.user.nil? || Current.user.id.nil?
        Current.user = nil
        session[:user_id] = nil
      end
    else
      Current.user = nil
    end
  end
end
