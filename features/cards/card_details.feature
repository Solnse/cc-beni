@in-progress
Feature: User manages card details
  @in-progress
  Scenario: User adds new card details
    Given a card exists with the name: "United Mileage Plus Explorer", type: "Visa"
    When I go to the edit page for that card
    And I fill in "apr" with "19.99"
    And I fill in "reward type" with "miles"
    And I fill in "special promotion" with "Yes"
    And I fill in "promotion requirements" with "Spend $1000 within 3 months"
    And I fill in "promotion offer" with "10,000 bonus miles"
    And I fill in "activation date" with "12/23/2011"
    When I press "Create"
    Then I should be on the cards list page
    And I should see "card successfully updated."