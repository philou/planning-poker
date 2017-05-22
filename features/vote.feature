Feature: Vote

  @javascript
  Scenario: A vote was started

    Given "Joe" already entered the "Daltons" space
    And "William" already entered the "Daltons" space
    When "Joe" starts a vote from his browser
    Then "William" should see a vote countdown

  @javascript
  Scenario: Enter the vote after it is started

    Given "Joe" already entered the "Daltons" space
    And "Joe" started a vote from his browser
    When "William" enters the "Daltons" space
    Then "William" should see a vote countdown

  @wip
  @javascript
  Scenario: A vote of one

    Given "Amy" already entered the "27s" space
    And "Amy" started a vote
    When "Amy" votes 5
    And "Amy" waits for the end of the vote
    #Then "Amy" should see a vote result of 5

  @wip
  @javascript
  Scenario: A vote of many

    Given "Joe" already entered the "Daltons" space
    And "William" already entered the "Daltons" space
    And "Joe" started a vote from his browser
    When "Joe" votes 5 from his browser
    When "William" votes 3
    And "William" waits for the end of the vote
    #Then "William" should see a vote result of 4
