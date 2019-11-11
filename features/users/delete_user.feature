Feature: Delete user
  As a user
  I want to delete my account
  In order to stop using the site

  Background:
    Given I exist as a user
    And I am logged in
    And I visit the Edit User page

  @javascript
  Scenario: Delete user
    When I click on the delete account button
    Then My account should be deleted