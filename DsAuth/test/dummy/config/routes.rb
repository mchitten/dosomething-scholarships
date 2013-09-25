Rails.application.routes.draw do

  mount DsAuth::Engine => "/ds_auth"
end
