Feature: Yahoo Search

  Scenario: I can find Watir home page
    Given I am at yahoo.com page
    When I search Yahoo for Watir
    Then I should see Watir - Official Site at Yahoo search results
