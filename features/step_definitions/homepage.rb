def enter_team_space(contributor_name, team_name)
  visit root_path

  within("#session") do
    fill_in 'Team', :with => team_name
    fill_in 'Name', :with => contributor_name
  end
  click_button 'Enter'
end

Given(/^"([^"]*)" already entered the "([^"]*)" space$/) do |contributor_name, team_name|
  enter_team_space(contributor_name, team_name)
end

When(/^"([^"]*)" is the first to enter the "([^"]*)" space$/) do |contributor_name, team_name|
  enter_team_space(contributor_name, team_name)
end
When(/^"([^"]*)" enters the "([^"]*)" space$/) do |contributor_name, team_name|
  enter_team_space(contributor_name, team_name)
end


Then(/^he should see the error "([^"]*)"$/) do |error_message|
  expect(page).to have_current_path(root_path)

  within("div.alert") do
    expect(page).to have_content(error_message)
  end
end
