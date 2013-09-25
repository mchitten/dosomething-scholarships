module DsAuth
  class UsersController
    private
      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(:email, :fbid, :uid, :is_admin, :mobile, :signup_type)
      end
  end
end
