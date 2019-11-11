Feature: Edit user
  As a registered user
  I want to edit my profile
  So I can change my user data

  Background:
    Given I exist as a user
    And I am logged in
    And I visit the Edit User page

  Scenario: I edit my email address
    When I edit my email address
    And I enter my current password
    And I save the edit form
    Then I should see a successful account edited message

  Scenario: I edit my password
    When I edit my password
    And I enter my current password
    And I save the edit form
    Then I should see a successful account edited message

  Scenario: I edit my account without my current password
    When I edit my email address
    And I don't enter my current password
    And I save the edit form
    Then I should see a missing password and current password message

  Scenario: I edit my password without confirmation
    When I edit my password
    And I don't enter my password confirmation
    And I save the edit form
    Then I should see a mismatched password message

  Scenario: I edit my password with a mismatched password confirmation
    When I edit my password
    And I enter the wrong password confirmation
    And I save the edit form
    Then I should see a mismatched password message