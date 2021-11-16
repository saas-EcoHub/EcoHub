Feature: CRUD operations for promotions

  As an user
  So that I can browse, create, edit and delete promotions
  I want to check the result by the operation I did
  
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

Scenario: Browse all promotions
    Given I am on the EcoHub homepage
    Then I should see all the promotions

Scenario: Add new valid promotion
    Given I am on the EcoHub homepage
    When I follow "Add a new promotion"
    Then I should be on the "Create New Promotion" page
    And I fill in "Keyword" with "10% off for first order"
    And I fill in "Source" with "Best Buy"
    And I select "Refer Code" from "Category"
    And I select "2021" from "promotion_expdate_1i"
    And I select "November" from "promotion_expdate_2i"
    And I select "13" from "promotion_expdate_3i"
    And I press "Create Promotion"
    Then I should be on the EcoHub homepage
    And I should see "10% off for first order"
    And I should see "Best Buy"
    And I should see "Refer Code"

Scenario: Edit an existing promotion
    Given I am on the details page for "$100 for free"
    When I follow "Edit"
    And I select "Refer Code" from "Category"
    And I press "Update Promotion"
    Then I should be on the details page for "$100 for free"
    And I should see "Refer Code"

Scenario: Delete an existing promotion
    Given I am on the details page for "$30 off over $45"
    When I follow "Delete"
    Then I should be on the EcoHub homepage