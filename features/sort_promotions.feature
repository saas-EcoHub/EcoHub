Feature: sort promotions by different categories

  As an user
  So that I can quickly browse promotions based on my preferences
  I want to see promotions sorted by expiration date
  
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

Scenario: sort promotions by expiration date in increasing order
    When I follow "Expiration Date"
    Then I should see "10% off over $50" before "$20 off over $25"
    And I should see "10% off over $50" before "$100 for free"