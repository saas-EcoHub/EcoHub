Feature: Like/dislike promotions

  As an user
  So that I can like valid promotions and dislike fake/expired promotions
  I want to upvote and downvote promotions
  
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

  Scenario: Upvote an existing promotion
    Given I am on the details page for "$100 for free"
    And I like this promotion
    Then I should see 1 votes for this promotion

  Scenario: Cancel my upvote on an existing promotion
    Given I am on the details page for "$100 for free"
    And I like this promotion
    And I cancel my like for this promotion
    Then I should see 0 votes for this promotion

  Scenario: Downvote an existing promotion
    Given I am on the details page for "$100 for free"
    And I dislike this promotion
    Then I should see -1 votes for this promotion

  Scenario: Cancel my downvote on an existing promotion
    Given I am on the details page for "$100 for free"
    And I dislike this promotion
    And I cancel my dislike for this promotion
    Then I should see 0 votes for this promotion