Feature: Sign up
  As a visitor
  I want to be able to sign up
  So I can gain access to protected areas of the site

  Background:
    Given I am not logged in
    And I do not have an account

  Scenario: I sign up with valid data
    When I sign up with valid data
    Then I should see a successful sign up message

  Scenario: I sign up with an invalid email address
    When I sign up with an invalid email address
    Then I should see an invalid email message

  Scenario: I sign up without a password
    When I sign up without a password
    Then I should see a missing password message

  Scenario: I sign up without a confirmed password
    When I sign up without a confirmed password
    Then I should see a missing confirmation password message

  Scenario: I sign up with a mismatched password and confirmation
    When I sign up with a mismatched password and password confirmation
    Then I should see a mismatched password message
