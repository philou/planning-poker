Then(/^([^ ]+) should become the animator$/) do | team_member_name |

  super_team = Team.find_by name: super_team_name
  team_member = TeamMember.find_by name: team_member_name, team: super_team

  expect(page).to have_current_path(team_member_path(team_member))
  expect(page).to have_content(team_member_name)
  expect(page).to have_button('Start Vote')

end
