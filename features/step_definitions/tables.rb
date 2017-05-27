Given(/^the "([^"]*)" entered space$/) do |team_name, contributors_table|
  contributors_table.raw.map(&:first).each do |contributor|
    enter_team_space(contributor, team_name)
  end
end

When(/^the "([^"]*)" vote$/) do |_team_name, votes_table|
  votes_table.hashes.each do |vote|
    Capybara.using_session(vote["Name"]) do
      visit_contributor_page(vote["Name"])
      vote(vote["Vote"])
    end
  end
end

Then(/^"([^"]*)" should see a repartition of votes$/) do |arg1, table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end