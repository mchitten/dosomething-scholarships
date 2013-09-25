module DsAuth
  class User < ActiveRecord::Base
    include Services

    # checks if a user with the given email exists in the DoSomething drupal database
    def self.exists?(email)
      if email.nil?
        false
      elsif !Services::Auth.check_exists(email).first.nil? || (email.index('@').nil? && email.gsub(/[^0-9]/, '').length == 10)
        true
      else
        false
      end
    end

    # Creates a new user in the Drupal database with the given information.
    #
    # @param [String] password
    #   The user's password.
    # @param [String] email
    #   The user's email address.
    # @param [Fixnum] fbid
    #   The user's (potential) Facebook ID.
    # @param [String] first
    #   The user's first name, if applicable.
    # @param [String] last
    #   The user's last name, if applicable.
    # @param [String] cell
    #    The user's cell phone number, if applicable.
    # @param [String] birthday
    #    The user's birthday.
    def self.register(password, email, fbid, first, last, cell, birthday)
      begin
        bday = Date.strptime(birthday, '%m/%d/%Y')
        response = Services::Auth.register(password, email, first, last, cell, bday.month, bday.day, bday.year)
        if response.code == 200 && response.kind_of?(Hash)
          return true
        else
          return false
        end
      rescue
        return false
      end
    end

    # logs in a user with the given parameters and creates an entry in the rails database if one doesn't exist already
    def self.login(registered, session, username, password, cell, fbid)
      if fbid != 0 # if logging in with Facebook
        uid = Services::Auth.check_admin(username).first
        if uid
          uid = uid['uid']
          roles = { 1 => 'administrator', 2 => 'authenticated user' }
        else
          uid = Services::Auth.check_exists(username).first
          if uid
            uid = uid['uid']
            roles = { 1 => 'authenticated user'}
          else
            return false
          end
        end
      else # if logging in through drupal
        response = Services::Auth.login(username, password)
        if response.code == 200 && response.kind_of?(Hash)
          uid = response['user']['uid']
          roles = response['user']['roles']
          if !response["profile"]["field_user_mobile"].empty?
            mobile = response["profile"]["field_user_mobile"]["und"][0]["value"]
          end
        else
          return false
        end
      end

      user = User.find_by_uid(uid)
      if !user # creates a new user if he/she isn't already in the database
        user = User.new(:uid => uid, :fbid => fbid, :email => username, :mobile => mobile, :is_admin => roles.values.include?('administrator'), :signup_type => (registered ? 'new' : 'exists'))
      elsif fbid != 0 # adds a fbid if they are logging in with facebook for the first time
        ### UPDATE TO EDIT FACEBOOK ON DRUPAL AS WELL ###
        user.fbid = fbid
      end
      user.save

      if Rails.env.test?
        # Allows us to fake administrator priveleges in tests
        if user && user.is_admin == true && !roles.values.include?('administrator')
          roles[99] = 'administrator'
        end
      end

      # set up session for current user
      session[:user_id] = uid
      session[:user_roles] = roles
      return true
    end

    # Sends MailChimp / Mobile Commons messages to a user.
    ##
    def handle_mc(options = {})
      begin
        Services::MailChimp.subscribe(self.email, options[:mailchimp]) unless options[:mailchimp].nil?
        Services::Mandrill.mail(options[:from_name], options[:from_email], self.email, options[:email_signup]) unless options[:email_signup].nil?
        Services::MobileCommons.subscribe(self.mobile, options[:mobile_commons]) unless self.mobile.nil? || options[:mobile_commons].nil?
      rescue
        # Sometimes these services throw an exception.  We can't do anything about them.
      end
    end
  end
end
