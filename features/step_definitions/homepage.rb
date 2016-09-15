When(/^"([^"]*)" is the first to enter the "([^"]*)" space$/) do |team_member_name, team_name|

  visit root_path

  within("#Session") do
    fill_in 'Team', :with => team_name
    fill_in 'Name', :with => team_member_name
  end
  click_button 'Enter'

end

Then(/^he should see the error "([^"]*)"$/) do |error_message|

  expect(page).to have_current_path(root_path)

  within("div.alert") do
    expect(page).to have_content(error_message)
  end
end
