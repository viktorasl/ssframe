Feature: Framer

  Scenario: Framer produces correct output
    Given I use a fixture named "frame"
    When I run `ssframe frame`
    Then a file named "ssframe/en-GB/iPhone X-2-calendar.png" should exist
    And a file named "ssframe/de-DE/iPhone X-2-calendar.png" should exist
