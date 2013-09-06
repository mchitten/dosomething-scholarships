Then /^I should see "(.*?)"$/ do |content|
  expect(page).to have_content content
end

Then /^there should be (\d+) "(.*?)" elements?$/ do |count, element|
  expect(page).to have_css(element, count: count)
end