Then(/^Joe should become the animator$/) do

  super_team = Team.find_by name: super_team_name
  joe = TeamMember.find_by name: 'Joe', team: super_team

  expect(page).to have_current_path(team_member_path(joe))
  expect(page).to have_content('Joe')
  expect(page).to have_button('Start Vote')

end
