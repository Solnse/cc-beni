require 'rubygems'
require 'mechanize'
require 'hpricot'
 
   stats_url = "http://www.creditcards.com/low-interest.php"
  
   # instantiate/initialise web agent ..
   agent = Mechanize.new
  
   # .. and get the weblog statistics page
   page = agent.get(stats_url)
    doc = Hpricot(page.content)
   
    
    
        
  
(doc/"table.schumer-box").each do |table|
     (table/"tr").each do |trrr|
	 (trrr/"th/table/tr/td/a").each do |maintext|
			p maintext.inner_html
		end
	 (trrr/"td/table/tr/td.rate-top").each do |maintext|
			p maintext.inner_html
		end
(trrr/"td/table/tr/td.rates-bottom").each do |maintext|
			p maintext.inner_html
		end


	 (trrr/"td").each do |maintext|
		if maintext.attributes.to_s.include?("details")
			p maintext.inner_html.split("<li>")
		else
 		end
	 end	
	       end 
break;
end
  
