Feature: enter cards
  In order to to have cards in the database
  A user
  Should be able to add cards to the database
 
    Background:
      Given I am logged in
 
    Scenario: User enters a valid card
      When I enter valid card data
 #     Then I should see a successful card added message
     
    Scenario: User enters invalid card type
      When I enter invalid card type
      Then I should see an invalid card type message
      
    Scenario: User enters invalid card name
      When I enter invalid card name
      Then I should see an invalid card name message
      
    

    Scenario: User Visot Home Page
      Given I am on home page
      
      Then  click on  show all cards
      Then  I go To Cards Index Page
      Then  I Enter Card Name For Search with visa
      Then  Click to submit button 
      Then  I go to search page 
      Then  I Can See Vanquis Visa card name is there
