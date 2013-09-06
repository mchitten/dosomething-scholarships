Feature: Share a Stat
  As a site user
  I can view share a stats
  and send stats to my friends

  Background:
    Given there is a share_a_stat

  Scenario: Visit the Share a Stat homepage
    Given I am on "/"
    Then I should see "Campaigns"
    And there should be 1 ".scholarship" element
    And there should be 2 "img" elements
    And I should see "Test SaS"
    And I should see "This is the Share a Stat's description"
    And I should see "GO"

  Scenario: Visit a Share a Stat page
    Given I am on the created share_a_stat
    Then I should see "Campaigns"
    Then I should see "Test SaS"
    And I should see "This is the Share a Stat's description"
    And I should see "Test Tip"
    And there should be 1 ".my-name" element
    And there should be 1 ".my-number" element
    And there should be 6 ".friend-number" elements
