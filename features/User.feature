Feature: Users can do lot of stuff

  Scenario: User sign in
    Given the following User:
      | name                  | test_user |
      | password              | secret    |
      | password_confirmation | secret    |
    When he logs in with password "secret"
    Then he should see "Welcome test_user"

  Scenario: User sign up
    Given the following User-template
      | name                  | test_user             |
      | password              | secret                |
      | password_confirmation | secret                |
      | email                 | test_user@example.com |
    When he signs up
    Then he should see "Account 'test_user' created"
    And he should see "Please sign_in to use your account"