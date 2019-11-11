Feature: Sign out
  As a signed in user
  I should be able to sign out
  So I can protect my account from unauthorized access

  Scenario: I sign out
    Given I exist as a user
    And I am logged in
    When I sign out
    Then I should see a successful sign out message
    When I return to the site
    Then I should be signed out