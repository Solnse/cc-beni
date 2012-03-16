def card
  @card 
end

def valid_card
  @card ||= { :card_name => 'Test Card', :card_type => 'Visa' }
end

def invalid_type
  @card ||= { :card_name => 'Test Card', :card_type => 'notacardtype' }
end

def invalid_name
  @card ||= { :card_name => '', :card_type => 'Visa' }
end

def add_card valid_card
  visit '/cards/new'
  fill_in "card_card_name", :with => card[:card_name]
  fill_in "card_card_type", :with => card[:card_type]
  click_button "Save New Card"
end
  
### Given ###

### When ###
When /^I enter valid card data$/ do
  add_card valid_card
end

When /^I enter invalid card type$/ do
  add_card invalid_type
end

When /^I enter invalid card name$/ do
  add_card invalid_name
end

### Then ###
Then /^I should see a successful card added message$/ do
  page.should have_content "Card was successfully created"
  page.should_not have_content "Invalid card name"
  page.should_not have_content "Invalid card type"
end

Then /^I should see an invalid card type message$/ do
  page.should have_content "only allows Visa, MasterCard, Amex, or Discover"
  page.should_not have_content "Card was successfully created"
end

Then /^I should see an invalid card name message$/ do
  page.should have_content "should not be empty!"
  page.should_not have_content "Card was successfully created"
end
