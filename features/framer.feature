Feature: Framer

  Scenario: Framer produces correct output
    Given I use a fixture named "frame"
    When I run `ssframe frame`
    Then the output should contain "en-GBde-DE"
