require "ds_auth/engine"
require File.join(File.dirname(__FILE__), "ds_auth/railtie")

module DsAuth
  autoload :Hook, File.join(File.dirname(__FILE__), "ds_auth/hook")
  autoload :InstanceMethods, File.join(File.dirname(__FILE__), "ds_auth/instance_methods")
end
