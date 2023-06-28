@tag
Feature: Calculator

  @debug
  Scenario: 3 + 38 = 41
    Given I open calculator
    And calculator is empty
    When I press number 3
    And I press operation '+'
    And I press number 3
    And I press number 8
    And I press operation '='
    Then I expect result '41'