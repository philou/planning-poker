Feature: Animator

  Scenario Outline: The first to enter a team page becomes the animator

    When <Dude> is the first to enter the team space
    Then <Dude> should become the animator

  Examples:
  | Dude |
  | Joe  |
  | Kath |
