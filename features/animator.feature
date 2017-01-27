Feature: Animator

  Scenario Outline: The first to enter a team page becomes the animator

    When "<dude>" is the first to enter the "<team>" space
    Then "<dude>" should become the animator of the "<team>" session

    Examples:
    | dude | team    |
    | Joe  | Daltons |
    | Amy  | 27s     |

  @wip
  Scenario: The animator can start a vote

    Given "Amy" already entered the "27s" space
    When "Amy" starts a vote
    Then "Amy" should see a countdown start
