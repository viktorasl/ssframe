Feature: Framer

  Scenario: Framer produces correct output
    When I run `ssframe frame`
    Then the output should contain "/ssframe/lib/assets/empty.png"
