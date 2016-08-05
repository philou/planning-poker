When(/^([^ ]+) is the first to enter the ([^ ]+) space$/) do |team_member_name, team_name|

  visit root_path

  within("#Session") do
    fill_in 'Team', :with => team_name
    fill_in 'Name', :with => team_member_name
  end
  click_button 'Enter'

end
