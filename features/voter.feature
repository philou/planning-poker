Feature: Voter

  @wip
  Scenario: The second to join becomes a voter

    Given "Amy" already entered the "27s" space
    When "Kurt" enters the "27s" space
    Then "Kurt" should become a voter in the "27s" session

  @wip
  Scenario: Later comers become voters

    Given "Joe" already entered the "Daltons" space
    And "William" already entered the "Daltons" space
    When "Avrell" enters the "Daltons" space
    Then "Avrell" should become a voter in the "Daltons" session
