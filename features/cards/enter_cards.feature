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

    Scenario: Adding The Vote To Credit card by a general user
      Given I am on cards index page
      
      Then  click on  show all cards
   
      When I Click on add vote link
      Then My Vote Count Get Increased


Scenario: Down Size The Vote To Credit card by a general user
      Given I am on cards index page
      
      Then  click on  show all cards
   
      When I Click on down vote link
      Then My Vote Count Get Descresed

Scenario: add a card from user profile page. and once added then at second time it should not add it
      Given I am logged in with user
      
      Then  I select a card to get added to my profile

      Then the card get added to my profile
  
      When I again try to add same card
      Then I see a message already added
    
Scenario: here check that user find a cards related to there need of purchase so the cards fetch should be eithet tag of that word or should be speciality of that card


      Given I am logged in with user
      
      Then  I enter purpose of credit card as low

      Then i get a list of cards and i click to show benifits
  
      Then I should see a low word related to the search 

       


Scenario: here i will check for user intrest for purchasing a card and admin gives a suggession for the same and user will read that suggession  


      Given I am logged in with user
      
      When I Go To home page 
      Then I click on already dont have credit card
      Then i fill the information
      Then i logout as a normal user
      When I log in as admin user
      Then I click on send member advice
      Then I fill up the particular user form
      Then i logout from admin
      When i login as a member
      Then i should see the admin message


 
       


