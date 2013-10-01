Feature: Users can create accounts

  Scenario: User sign up
    Given the following User-template
      | name                  | test_user1             |
      | password              | secret                 |
      | password_confirmation | secret                 |
      | email                 | test_user2@example.com |
    When he signs up
    Then he should see "Account 'test_user1' created"
    And he should see "Please sign in to use your account"

  Scenario: User can sign up and login instantly
    Given the following User-template
      | name                  | test_user2             |
      | password              | secret                 |
      | password_confirmation | secret                 |
      | email                 | test_user2@example.com |
    When he signs up
    Then he should be able to sign in

  Scenario: User can not sign up if password_confirmation is empty
    Given the following User-template
      | name                  | test_user3             |
      | password              | secret                 |
      | password_confirmation |                        |
      | email                 | test_user3@example.com |
    When he signs up
    Then he should see "Account wasn't created"