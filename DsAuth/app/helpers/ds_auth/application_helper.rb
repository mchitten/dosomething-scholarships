module DsAuth
  module ApplicationHelper
    def authenticated?
      (session[:user_id] && session[:user_id].to_i > 0) && (session[:user_roles] && session[:user_roles].values.include?('authenticated user'))
    end

    def admin?
      authenticated? && session[:user_roles].values.include?('administrator')
    end
  end
end
