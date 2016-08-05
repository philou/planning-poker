When(/^([^ ]+) is the first to enter the team space$/) do |team_member_name|

  visit root_path

  within("#Session") do
    fill_in 'Team', :with => super_team_name
    fill_in 'Name', :with => team_member_name
  end
  click_button 'Enter'

end
