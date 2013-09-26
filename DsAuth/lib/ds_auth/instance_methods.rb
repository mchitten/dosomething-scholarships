module DsAuth::InstanceMethods
  def gate_page(*opts)
    config_options = opts[0]
    my_roles = (session[:user_roles] ? session[:user_roles].values : [])

    # Authenticated user role
    unless my_roles.include?('authenticated user')
      flash[:error] = "Please log in to see that."
      redirect_to login_path
      return
    end

    # Required roles
    if config_options[:require]
      roles = config_options[:require].map { |m| m.to_s }
      has_role = !(roles & my_roles).empty? && ((roles & my_roles).length == roles.length)
      unless has_role && session[:user_id].to_i > 0
        session.delete(:user_roles)
        session.delete(:user_id)
        flash[:error] = "You must be an administrator to see that."
        redirect_to login_path
        return
      end
    end

    true
  end
end
