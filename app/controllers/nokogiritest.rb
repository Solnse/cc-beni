require 'rubygems'
require 'mechanize'
require 'hpricot'
 
   stats_url = "http://www.cardratings.com/cardrepfr.html"
  
   # instantiate/initialise web agent ..
   agent = Mechanize.new
  
   # .. and get the weblog statistics page
   page = agent.get(stats_url)
    doc = Hpricot(page.content)
   
    
    
        
  
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
