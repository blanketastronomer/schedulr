Feature: Sign in
  As a user
  I want to be able to sign in
  So I can gain access to protected areas of the site

  Background:
    Given I am not logged in

  Scenario: I cannot sign in if not registered
    And I do not have an account
    When I sign in with valid data
    Then I should see an invalid user message

  Scenario: I can sign in with valid data
    And I have an account
    When I sign in with valid data
    Then I should see a successful sign in message

  Scenario: I cannot sign in with the wrong email
    And I have an account
    When I sign in with an incorrect email
    Then I should see an invalid email address message

  Scenario: I cannot sign in with the wrong password
    And I have an account
    When I sign in with an incorrect password
    Then I should see an invalid password message
