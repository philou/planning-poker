Then(/^"([^"]*)" should become the animator of the "([^"]*)" session$/) do | team_member_name, team_name |

  team = Team.find_by name: team_name
  team_member = TeamMember.find_by name: team_member_name, team: team

  expect(page).to have_current_path(team_member_path(team_member))
  expect(page).to have_content(team_member_name)
  expect(page).to have_content(team_name)
  expect(page).to have_button('Start Vote')

end
