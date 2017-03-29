def expect_to_be_on_team_member_page(team_member_name, team_name)
  team = Team.find_by name: team_name
  team_member = TeamMember.find_by name: team_member_name, team: team

  expect(page).to have_current_path(team_member_path(team_member))
  expect(page).to have_content(team_member_name)
  expect(page).to have_content(team_name)
end

Then(/^"([^"]*)" should become the animator of the "([^"]*)" session$/) do | team_member_name, team_name |
  expect_to_be_on_team_member_page(team_member_name, team_name)

  expect(page).to have_button('Start Vote')
end

Then(/^"([^"]*)" should become a voter in the "([^"]*)" session$/) do |team_member_name, team_name|
  expect_to_be_on_team_member_page(team_member_name, team_name)

  expect(page).to have_content('You are a voter')
end

When(/^"([^"]*)" starts a vote$/) do |team_member_name|
  team_member = TeamMember.find_by name: team_member_name

  visit team_member_path(team_member)

  click_button('Start Vote')
end

# TODO remove the 'from his browser' from the step def. This is really implementation specific
# I would rather have steps starting with 'I ...' for things happening in the main test session
# and steps starting with other names for things happening in other sessions
When(/^"([^"]*)" starts a vote from his browser$/) do |team_member_name|
  Capybara.using_session(team_member_name) do
    step "\"#{team_member_name}\" starts a vote"
  end
end

Then(/^"([^"]*)" should see a countdown start$/) do |_team_member_name|
  # TODO do some polling instead of sleeping for a full second
  sleep 1

  expect(page).to have_content('seconds remaining')
end
