Feature: Errors

  Scenario: A team name is required to enter the vote

    When "" is the first to enter the "Fabulous 5" space
    Then he should see the error "Please specify a non blank name to enter the vote"

  Scenario: A name is required to enter the vote

    When "Joe" is the first to enter the "" space
    Then he should see the error "Please specify a non blank team name to enter the vote"
