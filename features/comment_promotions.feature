Feature: Comment and reply for promotions

  As an user
  So that I can make comment and reply any comment for promotions
  I want to leave my opinion for the promotions
  
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

Scenario: Make comment for a specific promotion
    Given I am on the details page for "$100 for free"
    When I fill in "content" with "Nice"
    And I press "post comment"
    Then I should see "Nice"
    
Scenario: Like a comment
    Given I am on the details page for "$100 for free"
    And I fill in "content" with "Nice"
    And I press "post comment"
    And I like this comment
    Then I should see "Nice" before "1"

Scenario: Dislike a comment
    Given I am on the details page for "$100 for free"
    And I fill in "content" with "Nice"
    And I press "post comment"
    And I like this comment
    And I like this comment
    And I dislike this comment
    And I dislike this comment
    Then I should see "Nice" before "0"