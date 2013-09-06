Feature: Share a Stat
  As a site user
  I can view share a stats
  and send stats to my friends

  Background:
    Given there is a share_a_stat

  Scenario: Visit the Share a Stat homepage
    Given I am on "/"
    Then I should see "Campaigns"
    And I should see "Test SaS"
    And I should see "This is the Share a Stat's description"
    And I should see "GO"