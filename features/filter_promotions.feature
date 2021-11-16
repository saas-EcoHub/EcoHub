Feature: filter operations for promotions

  As an user
  So that I can filter the promotions by category
  I want to only see the category that I'm interested on
  
Background: promotions in database
  Given the following users exist:
  | nickname | email             | password  |
  | Vicky    | viccky99@mail.com | fakeword  |
  | Sarah    | IamSa223@col.edu  | 892ndlwhf |

  Given I am on the EcoHub homepage
  And I am logged in as "IamSa223@col.edu" with password "892ndlwhf"
  And the following promotions exist:
  | keyword          | source     | category      | expdate          |
  | $100 for free    | HundsonBay | Common        | 2022-May-25      |
  | 10% off over $50 | Weee!      | Refer Code    | 2021-November-25 |
  | $20 off over $25 | Gorillas   | New User Only | 2021-December-22 |
  | $30 off over $45 | Buyk       | New User Only | 2022-January-11  |
  
Scenario: restrict to promotions with 'New User Only'
    Given I am on the EcoHub homepage
    When I uncheck the following categories: "Refer Code, Common, Other"
    And I press "categories_submit"
    Then I should see "$20 off over $25"
    And I should see "$30 off over $45"

Scenario: all categories selected
    Given I am on the EcoHub homepage
    When I check the following categories: "New User Only, Refer Code, Common, Other"
    And I press "categories_submit"
    Then I should see "$100 for free"
    And I should see "10% off over $50"
    And I should see "$20 off over $25"
    And I should see "$30 off over $45"
    