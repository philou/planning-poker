Feature: Animator

  Scenario: The first to enter a team page becomes the animator

    When Joe is the first to enter the team space
    Then Joe should become the animator
