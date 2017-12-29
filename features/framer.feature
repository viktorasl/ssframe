Feature: Framer

  Scenario: Produces framed screenshots for multiple languages
    Given I use a fixture named "frame"
    When I run `ssframe frame '{"en-GB":[{"2-calendar":"Stay up to date with your\'n'whole salon'"'"'s calendar"}],"de-DE":[{"2-calendar":"Mit dem gesamten Kalender\'n'behalten Sie immer den Überblick"}]}'`
    Then a file named "ssframe/en-GB/iPhone X-2-calendar.png" should exist
    And a file named "ssframe/de-DE/iPhone X-2-calendar.png" should exist

  Scenario: Produces multiple framed screenshots for single language
    Given I use a fixture named "frame"
    When I run `ssframe frame '{"en-GB":[{"2-calendar":"Stay up to date with your\'n'whole salon'"'"'s calendar"},{"5-search":"Find the important\'n'details about your customer"}]}'`
    Then a file named "ssframe/en-GB/iPhone X-2-calendar.png" should exist
    And a file named "ssframe/en-GB/iPhone X-5-search.png" should exist
