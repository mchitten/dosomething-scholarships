Given /^there is a (.*?)$/ do |factory|
  f = FactoryGirl.create(factory.to_sym)
  @created ||= {}
  @created[factory] = f.to_param
end

Given /^I am on the created share_a_stat$/ do
  visit "/social-scholarship/#{@created['share_a_stat']}"
end