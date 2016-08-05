When(/^Joe is the first to enter the team space$/) do

  visit root_path

  within("#Session") do
    fill_in 'Team', :with => super_team_name
    fill_in 'Name', :with => 'Joe'
  end
  click_button 'Enter'

end
