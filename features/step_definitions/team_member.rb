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

Then(/^"([^"]*)" should see a countdown start$/) do |team_member_name|
  team_member = TeamMember.find_by name: team_member_name
  visit team_member_path(team_member)

  expect(page).to have_selector('#voteCountdown', visible: true)

  pending # Write code here that turns the phrase above into concrete actions

  # check a status of whatever to make sure it is decreasing

  # TODO check in specs
  # check that it goes down
  #   check later, and verify that the position has decreased
  # check that it stops at 0
  #   wait enough for it to stick at 0
  #   we could parametrize the vote duration in order to make the tests faster

end
