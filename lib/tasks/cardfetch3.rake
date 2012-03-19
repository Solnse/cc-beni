namespace  :all_cards do
task :fetch_cards3 => :environment do 
require 'rubygems'
require 'mechanize'
require 'hpricot'
 
   stats_url = "http://www.cardratings.com/cardrepfr.html"
  
   # instantiate/initialise web agent ..
   agent = Mechanize.new
  
   # .. and get the weblog statistics page
   page = agent.get(stats_url)
   doc = Hpricot(page.content)
   parse_html_card(doc)	
   page = agent.click(page.link_with(:text => 'Low Interest'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc) 
   page = agent.click(page.link_with(:text => 'Low Introductory Rate'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc) 
   page = agent.click(page.link_with(:text => 'Balance Transfer'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc) 
   page = agent.click(page.link_with(:text => 'Cash Back'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc) 
   page = agent.click(page.link_with(:text => 'Gas Cards'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc) 
   page = agent.click(page.link_with(:text => 'Rewards Credit Cards'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc) 
   page = agent.click(page.link_with(:text => 'Student Credit Cards'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc) 
   page = agent.click(page.link_with(:text => 'Business Credit Cards'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc) 
   page = agent.click(page.link_with(:text => 'Airline Credit Cards'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc) 
   page = agent.click(page.link_with(:text => 'Credit Card Deals'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc) 
   page = agent.click(page.link_with(:text => 'Prepaid Cards'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc) 
   page = agent.click(page.link_with(:text => 'Excellent Credit'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc)
   page = agent.click(page.link_with(:text => 'Good Credit'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc)
   page = agent.click(page.link_with(:text => 'Fair Credit'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc)
   page = agent.click(page.link_with(:text => 'Bad Credit'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc)
   page = agent.click(page.link_with(:text => 'Limited / No history'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc)
   page = agent.click(page.link_with(:text => 'American Express'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc)
   page = agent.click(page.link_with(:text => 'Capital One'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc)
   page = agent.click(page.link_with(:text => 'Chase'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc)
   page = agent.click(page.link_with(:text => 'Citibank'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc)
   page = agent.click(page.link_with(:text => 'Discover'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc)
   page = agent.click(page.link_with(:text => 'Iberia Bank'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc)
   page = agent.click(page.link_with(:text => 'MasterCard'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc)
   page = agent.click(page.link_with(:text => 'Meta Bank'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc)
   page = agent.click(page.link_with(:text => 'Pentagon Federal'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc)
   page = agent.click(page.link_with(:text => 'Simmons'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc)
   page = agent.click(page.link_with(:text => 'Visa'))
   doc = Hpricot(page.content)	 
   parse_html_card(doc)
   



 
    

    
    
     
end

def parse_html_card(doc)
   
  
(doc/"div.carditem").each do |divc|
   # p divc.inner_html
	card = Card.new
	card.card_type = "Visa"     
	(divc/"h3,div").each do |info|
 	 if  info.attributes.to_s.include?"Info" 
		p "featureeeee"
                (info/"li").each do |x|
		card.features.new(:content=> x.inner_text)
		
		end
         end
	 if info.attributes.to_s.include?"carditem clearfix"
		 
		card.card_name = (info/"h3 a.trackLink").inner_text.split("\n")[0]
	 end	
	card.save
end
  end


end

end