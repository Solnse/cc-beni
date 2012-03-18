namespace  :all_cards do
task :fetch_cards1 => :environment do  
 require 'rubygems'
 require 'mechanize'
 require 'hpricot'
stats_url = "http://www.choose.net/money/credit-cards/compare/0-balance-transfer/"
  
   # instantiate/initialise web agent ..
   agent = Mechanize.new
  
   # .. and get the weblog statistics page
   page = agent.get(stats_url)
   login_form = page.form_with(:action => '/money/credit-cards/compare/0-balance-transfer/')
   page = agent.submit login_form
   doc = Hpricot(page.content)
   
   parse_html_code(doc,'0% period','Transfer Fee','Add Info','Sutaible Pending','Apr')    
   
   page = agent.click(page.link_with(:text => 'Life Balance Transfers'))
   doc = Hpricot(page.content)
    parse_html_code(doc,'balance transfer offer','Transfer Fee','Add Info','Sutaible Pending','Apr')
    
    
   page = agent.click(page.link_with(:text => '0% Super Transfers'))
   login_form = page.form_with(:action => '/money/credit-cards/compare/super-balance-transfer/')
   page = agent.submit login_form
   doc = Hpricot(page.content)
   parse_html_code(doc,'0% period','Money Transfer Fee','Add Info','Sutaible Pending','Apr')
   
   page = agent.click(page.link_with(:text => '0% with Purchases'))
   login_form = page.form_with(:action => '/money/credit-cards/compare/0-balance-transfer-purchase/')
   page = agent.submit login_form
   doc = Hpricot(page.content)
   parse_html_code(doc,'Balance Transfer Offer','Transfer Fee','Add Info','Sutaible Pending','Apr')
   
   page = agent.click(page.link_with(:text => '0% Purchases'))
   login_form = page.form_with(:action => '/money/credit-cards/compare/0-purchase/')
   page = agent.submit login_form
   doc = Hpricot(page.content)
  parse_html_code(doc,'period','rewards','Add Inform','Apr')
    
  page = agent.click(page.link_with(:text => 'Low Purchase Rate'))
   doc = Hpricot(page.content)
  parse_html_code(doc,'Purchase Standard rate','purchase intro','rewards','Add Info')
  
   page = agent.click(page.link_with(:text => 'Use Abroad'))
   login_form = page.form_with(:action => '/money/credit-cards/compare/use-abroad/')
   page = agent.submit login_form
   doc = Hpricot(page.content)
  parse_html_code(doc,'Foreign Transaction fee','Cash rate','rewards','notimp','annual fee ','standard rate')
 
   page = agent.click(page.link_with(:text => 'Poor Credit Score'))
   doc = Hpricot(page.content)
  parse_html_code(doc,'sutaible for those','reward','credit limit','transfer rate')
   
   page = agent.click(page.link_with(:text => 'Rewards'))
   login_form = page.form_with(:action => '/money/credit-cards/compare/rewards/')
   page = agent.submit login_form
   doc = Hpricot(page.content)
  parse_html_code(doc,'reward','purchase intro','add info','annual fee','standard rate')
 
   page = agent.click(page.link_with(:text => 'Cash Back'))
    doc = Hpricot(page.content)
  parse_html_code(doc,'reward','purchase intro','add info','annual fee','standard rate')
  
    page = agent.click(page.link_with(:text => 'Air Miles'))
       login_form = page.form_with(:action => '/money/credit-cards/compare/air-miles/')
   page = agent.submit login_form

    
    doc = Hpricot(page.content)
  parse_html_code(doc,'reward','purchase intro','add info','annual fee','standard rate')
page = agent.click(page.link_with(:text => 'Instant Decision'))
       login_form = page.form_with(:action => '/money/credit-cards/compare/instant-decision/')
   page = agent.submit login_form

    
    doc = Hpricot(page.content)
  parse_html_code(doc,'balance transfer offer','purchase intro offer','rewards','add information')

    
    

    
        

    
    
end

def parse_html_code(doc,title1='',title2='',title3='',title4='',title5='',title6='')
 cardold = []
(doc/"table.comparison//tr").each do |row|
   i = -1
    card = Card.new
    
    (row/"td").each do |cell|
       
      if cell.attributes.to_s.include?("example bold")
        card = cardold[cardold.length-1]
        card.example = cell.inner_text
        
        p card 
        p "this is card"
        card.save
      else  
       i = i+1 
       
       if i == 0
       card.card_name = cell.inner_text
       card.card_type = "Visa"
       end
       if i == 1
       card.carddetails.new(:title=>title1,:short_desc=>cell.inner_text)
       end      
       if i == 2
       card.carddetails.new(:title=>title2,:short_desc=>cell.inner_text)
       end
       if i == 3
       card.moreinfo = cell.inner_text
       end
       if i == 4
       card.carddetails.new(:title=>title3,:short_desc=>cell.inner_text)
       end
       if i == 5
       card.carddetails.new(:title=>title4,:short_desc=>cell.inner_text)
       end
      end 
     end
    card.save
    cardold << card 
end

end

end
