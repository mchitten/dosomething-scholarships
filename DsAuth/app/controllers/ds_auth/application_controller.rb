module DsAuth
  class ApplicationController < ActionController::Base
    def confirm_unauthenticated
      (!session[:user_id] || session[:user_id] == 0)
    end
  end
end
