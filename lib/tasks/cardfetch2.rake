namespace  :all_cards do
task :fetch_cardstwo => :environment do 
require 'rubygems'
require 'mechanize'
require 'hpricot'
 
   stats_url = "http://www.creditcards.com/low-interest.php"
  
   # instantiate/initialise web agent ..
   agent = Mechanize.new
  
   # .. and get the weblog statistics page
   page = agent.get(stats_url)
    doc = Hpricot(page.content)
  
   parse_html_card_code(doc,'low-interest')

   page = agent.click(page.link_with(:text => 'Page 2'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'low-interest') 
   page = agent.click(page.link_with(:text => 'Page 3'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'low-interest') 
   page = agent.click(page.link_with(:text => 'Page 4'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'low-interest') 
   page = agent.click(page.link_with(:text => 'Balance Transfer Cards'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Balance Transfer Cards') 
   page = agent.click(page.link_with(:text => 'Page 2'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Balance Transfer Cards') 
   page = agent.click(page.link_with(:text => '0% APR Credit Cards'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'0% APR Credit Cards') 
   page = agent.click(page.link_with(:text => 'Page 2'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'0% APR Credit Cards') 
   page = agent.click(page.link_with(:text => 'Page 3'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'0% APR Credit Cards')
   page = agent.click(page.link_with(:text => 'Reward Credit Cards'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Reward Credit Cards') 
   page = agent.click(page.link_with(:text => 'Page 2'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Reward Credit Cards') 
   page = agent.click(page.link_with(:text => 'Page 3'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Reward Credit Cards') 
   page = agent.click(page.link_with(:text => 'Page 4'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Reward Credit Cards') 
   page = agent.click(page.link_with(:text => 'Page 5'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Reward Credit Cards') 
 
   page = agent.click(page.link_with(:text => 'Points'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Points') 
   page = agent.click(page.link_with(:text => 'Page 2'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Points') 
   page = agent.click(page.link_with(:text => 'Page 3'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Points')
   
   page = agent.click(page.link_with(:text => 'Gas Cards'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Gas Cards') 
   page = agent.click(page.link_with(:text => 'Page 2'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Gas Cards')

page = agent.click(page.link_with(:text => 'Cash Back Credit Cards'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Cash Back Credit Cards') 
   page = agent.click(page.link_with(:text => 'Page 2'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Cash Back Credit Cards') 
   page = agent.click(page.link_with(:text => 'Page 3'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Cash Back Credit Cards')
   
page = agent.click(page.link_with(:text => 'Travel & Airline Credit Cards'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Travel & Airline Credit Cards') 
   page = agent.click(page.link_with(:text => 'Page 2'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Travel & Airline Credit Cards') 
   

page = agent.click(page.link_with(:text => 'Business Credit Cards'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc,'Business Credit Cards') 
   page = agent.click(page.link_with(:text => 'Page 2'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc,'Business Credit Cards') 
   page = agent.click(page.link_with(:text => 'Page 3'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Business Credit Cards')


page = agent.click(page.link_with(:text => 'Student Credit Cards'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Student Credit Cards') 
   
page = agent.click(page.link_with(:text => 'Prepaid & Debit Cards'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Prepaid & Debit Cards') 
 page = agent.click(page.link_with(:text => 'Page 2'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Prepaid & Debit Cards') 
  


page = agent.click(page.link_with(:text => 'Secured Credit Cards'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Secured Credit Cards') 
 

page = agent.click(page.link_with(:text => 'Instant Approval Cards'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Instant Approval Cards') 




page = agent.click(page.link_with(:text => 'Top Credit Cards'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Top Credit Cards') 

page = agent.click(page.link_with(:href => "/Mastercard.php"))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Mastercard') 
page = agent.click(page.link_with(:text => 'Page 2'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Mastercard') 


page = agent.click(page.link_with(:href => "/Visa.php"))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Visa') 
   page = agent.click(page.link_with(:text => 'Page 2'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Visa') 
   page = agent.click(page.link_with(:text => 'Page 3'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Visa')


page = agent.click(page.link_with(:text => 'Excellent Credit'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Excellent Credit') 
   page = agent.click(page.link_with(:text => 'Page 2'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Excellent Credit') 
   page = agent.click(page.link_with(:text => 'Page 3'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Excellent Credit') 
   page = agent.click(page.link_with(:text => 'Page 4'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Excellent Credit') 
   
page = agent.click(page.link_with(:text => 'Good Credit'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Good Credit') 
   page = agent.click(page.link_with(:text => 'Page 2'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Good Credit') 
   page = agent.click(page.link_with(:text => 'Page 3'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Good Credit') 

page = agent.click(page.link_with(:text => 'Fair Credit'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Good Credit') 
    


page = agent.click(page.link_with(:text => 'Bad Credit'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc,'Bad Credit') 
   page = agent.click(page.link_with(:text => 'Page 2'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Bad Credit') 

page = agent.click(page.link_with(:text => 'Limited or No Credit History'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Limited or No Credit History') 


   page = agent.click(page.link_with(:href => '/credit-score-estimator/'))


page = agent.click(page.link_with(:href => "/American-Express.php"))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'American-Express') 
  

   stats_url = "http://www.creditcards.com/credit-score-estimator/"
    page = agent.get(stats_url)
 
page = agent.click(page.link_with(:href => "/barclaycard.php"))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc) 
   stats_url = "http://www.creditcards.com/credit-score-estimator/"
    page = agent.get(stats_url)
   
page = agent.click(page.link_with(:href => "/Capital-One.php"))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Capital-One') 
   stats_url = "http://www.creditcards.com/credit-score-estimator/"
    page = agent.get(stats_url)
   
page = agent.click(page.link_with(:href => "/Chase.php"))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Chase')
   stats_url = "http://www.creditcards.com/credit-score-estimator/"
    page = agent.get(stats_url)
    
page = agent.click(page.link_with(:href => "/Citi.php"))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Citi')
   stats_url = "http://www.creditcards.com/credit-score-estimator/"
    page = agent.get(stats_url)
    
page = agent.click(page.link_with(:href => "/Discover.php"))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'Discover') 
  stats_url = "http://www.creditcards.com/credit-score-estimator/"
    page = agent.get(stats_url)
 
   
page = agent.click(page.link_with(:href => "/first-premier.php"))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'first-premier') 
   stats_url = "http://www.creditcards.com/credit-score-estimator/"
    page = agent.get(stats_url)
   
page = agent.click(page.link_with(:href => '/HSBC-Bank.php'))
   doc = Hpricot(page.content)	 
   parse_html_card_code(doc,'HSBC') 

   
end

def parse_html_card_code(doc,speciality='')
  

(doc/"table.schumer-box").each do |table|
 
 	card = Card.new
        card.speciality = speciality
         card.card_type = "Visa"
	card.save
     (table/"tr").each do |trrr|
	 (trrr/"th/table/tr/td/a").each do |maintext|
		 
			card.card_name = maintext.inner_text
			  
		end
           (trrr/"td/a").each do |x|
                   
                   image = x.inner_html.to_s.split("\"")[1]
                  if !image.blank?
                   system("wget -nd -r -l 2 -t 2 -P #{Rails.root}/app/assets/images/  "+image)
                      
		   card.fetch_image_name = image.split("/").last
		   end
 
		end
 	 (trrr/"td/table/tr/td.rate-top").each do |maintext|
			 card.carddetails.new(:title=> maintext.inner_text)
			   
			 card.save
		end
i=-1
(trrr/"td/table/tr/td.rates-bottom").each do |maintext|
			i=i+1;
			card.carddetails[i].short_desc = maintext.inner_text
			  
			#p card.carddetails[i]	
			#p i
			#p maintext.inner_html
			#card.carddetails[i].save
			#p card.carddetails[i].errors
		 	 
		end


	 (trrr/"td").each do |maintext|
		if maintext.attributes.to_s.include?("details")
	 		(maintext/"li").each do |fe|			
			 
			card.features.new(:content=>fe.inner_text)
			end


			
		else
 		end
	 end	
	       end 
		card.save
#		p "saving error"
	#	p card.errors
	 
 end

end

end

