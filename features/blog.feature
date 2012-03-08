Feature: blog

  Scenario: Tagged posts
    Given a post tagged with Basketball
    Given another post tagged with Basketball

    And a post tagged with Baseball
    And a post tagged with Soccer
    And a post tagged with Soccer and Basketball

    When I visit the homepage
    Then I should see all posts
    And I click on Basketball
    Then I should only see the posts tagged with Basketball

    And I click on Soccer

    Then I should only see the posts tagged with Basketball and Soccer

