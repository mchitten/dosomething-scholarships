require 'rails'
require 'ds_auth'

begin
  module DsAuth
    class Railtie < Rails::Railtie
      config.to_prepare do
        ApplicationController.send(:extend, DsAuth::Hook)
      end
    end
  end
rescue
  raise $!
end
