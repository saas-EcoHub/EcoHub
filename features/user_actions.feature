Feature: user interactions with application

  As an user
  So that I can sign up, sign in, and log in
  I want to access the application

Background: users in database

  Given the following users exist:
  | nickname | email             | password  |
  | Vicky    | viccky99@mail.com | fakeword  |
  | Sarah    | IamSa223@col.edu  | 892ndlwhf |

  And I am on the EcoHub home page

Scenario: exitsing user log in
    When I follow "Login"
    And I fill in "Email" with "viccky99@mail.com"
    And I fill in "Password" with "fakeword"
    And I press "Sign In"
    Then I should be on the EcoHub homepage
    And I should see "Vicky"

Scenario: user sign up
    When I follow "Sign Up"
    And I fill in "User Name" with "IamCucumber"
    And I fill in "Email" with "cucumDemo@mail.com"
    And I fill in "Password" with "ccccumber"
    And I fill in "Confirm Your Password" with "ccccumber"
    And I press "Sign Up"
    Then I should be on the EcoHub homepage
    And I should see "IamCucumber"

Scenario: user log out
    Given I am logged in as "IamSa223@col.edu" with password "892ndlwhf"
    And I press "Logout"
    Then I should not see "Sarah"