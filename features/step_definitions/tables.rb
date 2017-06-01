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

Then(/^"([^"]*)" should see a repartition of votes$/) do |_team_name, votes_table|
  votes_table.hashes.each do |vote|
   expect(page).to have_histogram(vote["Vote"], value: vote["Count"])
  end
end