Feature: Users can do lot of stuff

  Scenario: User login
    Given the following User:
      | name             | test_user |
      | password         | secret    |
      | password_confirm | secret    |
    When "test_user" logs in with password "secret"
    Then he should see "welcome test_user"