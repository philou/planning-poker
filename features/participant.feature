Feature: Participant

  Scenario: The second to join becomes a participant

    Given "Amy" already entered the "27s" space
    When "Kurt" enters the "27s" space
    Then "Kurt" should become a voter in the "27s" session

  Scenario: Later comers become participant

    Given "Joe" already entered the "Daltons" space
    And "William" already entered the "Daltons" space
    When "Avrell" enters the "Daltons" space
    Then "Avrell" should become a voter in the "Daltons" session


