def expect_to_be_on_contributor_page(contributor_name, team_name)
  team = Team.find_by name: team_name
  contributor = Contributor.find_by name: contributor_name, team: team

  expect(page).to have_current_path(contributor_path(contributor))
  expect(page).to have_content(contributor_name)
  expect(page).to have_content(team_name)
end

Then(/^"([^"]*)" should become the animator of the "([^"]*)" session$/) do | contributor_name, team_name |
  expect_to_be_on_contributor_page(contributor_name, team_name)

  expect(page).to have_button('Start Vote')
end

Then(/^"([^"]*)" should become a voter in the "([^"]*)" session$/) do |contributor_name, team_name|
  expect_to_be_on_contributor_page(contributor_name, team_name)

  expect(page).to have_content('You are a voter')
end

def start_vote_as(contributor_name)
  contributor = Contributor.find_by name: contributor_name

  visit contributor_path(contributor)

  click_button('Start Vote')
end

When(/^"([^"]*)" starts a vote$/) { |contributor_name| start_vote_as(contributor_name) }
Given(/^"([^"]*)" started a vote$/) { |contributor_name| start_vote_as(contributor_name) }

def vote(value)
  click_button(value)
end

When(/^"([^"]*)" votes (\d+)$/) do |_contributor_name, value|
  vote(value)
end

Then(/^"([^"]*)" should see a countdown start$/) do |_contributor_name|
  # TODO do some polling instead of sleeping for a full second
  sleep 1

  expect(page).to have_content('seconds remaining')
end


# TODO remove the 'from his browser' from the step def. This is really implementation specific
# I would rather have steps starting with 'I ...' for things happening in the main test session
# and steps starting with other names for things happening in other sessions

When(/^"([^"]*)" starts a vote from his browser$/) do |contributor_name|
  Capybara.using_session(contributor_name) do
    start_vote_as(contributor_name)
  end
end
Given(/^"([^"]*)" started a vote from his browser$/) do |contributor_name|
  Capybara.using_session(contributor_name) do
    start_vote_as(contributor_name)
  end
end
When(/^"([^"]*)" votes (\d+) from his browser$/) do |contributor_name, value|
  Capybara.using_session(contributor_name) do
    vote(value)
  end
end
