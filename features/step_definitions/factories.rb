Given /^there is a (.*?)$/ do |factory|
  FactoryGirl.create(factory.to_sym)
end