Feature: Users can sign into existing accounts

  Scenario: User can sign in
    Given the following User:
      | name                  | test_user |
      | password              | secret    |
      | password_confirmation | secret    |
    When he logs in with password "secret"
    Then he should see "Welcome test_user"

  Scenario: Not exisitng user can not sign in
    Given the following User-template
      | name     | test_user10 |
      | password | secret      |
    When he logs in with password "secret"
    Then he should see "Couldn't log in"