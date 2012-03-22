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
	p "sssssssssssssssssssss"
   
   parse_html_code(doc,page,agent,'0% period','Transfer Fee','Add Info','Sutaible Pending','Apr')    
   
   page = agent.click(page.link_with(:text => 'Life Balance Transfers'))
   doc = Hpricot(page.content)
    parse_html_code(doc,page,agent,'balance transfer offer','Transfer Fee','Add Info','Sutaible Pending','Apr')
    
    
   page = agent.click(page.link_with(:text => '0% Super Transfers'))
   login_form = page.form_with(:action => '/money/credit-cards/compare/super-balance-transfer/')
   page = agent.submit login_form
   doc = Hpricot(page.content)
   parse_html_code(doc,page,agent,'0% period','Money Transfer Fee','Add Info','Sutaible Pending','Apr')
   
   page = agent.click(page.link_with(:text => '0% with Purchases'))
   login_form = page.form_with(:action => '/money/credit-cards/compare/0-balance-transfer-purchase/')
   page = agent.submit login_form
   doc = Hpricot(page.content)
   parse_html_code(doc,page,agent,'Balance Transfer Offer','Transfer Fee','Add Info','Sutaible Pending','Apr')
   
   page = agent.click(page.link_with(:text => '0% Purchases'))
   login_form = page.form_with(:action => '/money/credit-cards/compare/0-purchase/')
   page = agent.submit login_form
   doc = Hpricot(page.content)
  parse_html_code(doc,page,agent,'period','rewards','Add Inform','Apr')
    
  page = agent.click(page.link_with(:text => 'Low Purchase Rate'))
   doc = Hpricot(page.content)
  parse_html_code(doc,page,agent,'Purchase Standard rate','purchase intro','rewards','Add Info')
  
   page = agent.click(page.link_with(:text => 'Use Abroad'))
   login_form = page.form_with(:action => '/money/credit-cards/compare/use-abroad/')
   page = agent.submit login_form
   doc = Hpricot(page.content)
  parse_html_code(doc,page,agent,'Foreign Transaction fee','Cash rate','rewards','notimp','annual fee ','standard rate')
 
   page = agent.click(page.link_with(:text => 'Poor Credit Score'))
   doc = Hpricot(page.content)
  parse_html_code(doc,page,agent,'sutaible for those','reward','credit limit','transfer rate')
   
   page = agent.click(page.link_with(:text => 'Rewards'))
   login_form = page.form_with(:action => '/money/credit-cards/compare/rewards/')
   page = agent.submit login_form
   doc = Hpricot(page.content)
  parse_html_code(doc,page,agent,'reward','purchase intro','add info','annual fee','standard rate')
 
   page = agent.click(page.link_with(:text => 'Cash Back'))
    doc = Hpricot(page.content)
  parse_html_code(doc,page,agent,'reward','purchase intro','add info','annual fee','standard rate')
  
    page = agent.click(page.link_with(:text => 'Air Miles'))
       login_form = page.form_with(:action => '/money/credit-cards/compare/air-miles/')
   page = agent.submit login_form

    
    doc = Hpricot(page.content)
  parse_html_code(doc,page,agent,'reward','purchase intro','add info','annual fee','standard rate')
page = agent.click(page.link_with(:text => 'Instant Decision'))
       login_form = page.form_with(:action => '/money/credit-cards/compare/instant-decision/')
   page = agent.submit login_form

    
    doc = Hpricot(page.content)
  parse_html_code(doc,page,agent,'balance transfer offer','purchase intro offer','rewards','add information')

    
    

    
        

    
    
end

def parse_html_code(doc,page,agent,title1='',title2='',title3='',title4='',title5='',title6='')
 cardold = []
	p "hhhhhhhhhhhhhhhhhhhhhhhh"
(doc/"table.comparison//tr").each do |row|
	p "aaaaaaaaaaaaaaaaaaaaaa"
   i = -1
    	
    card = Card.new
    p "zzzzzzzzzzzzzzzzzz"
    (row/"td").each do |cell|
	p "qqqqqqqqqqqqqqqqqqqqqq"
      if cell.attributes.to_s.include?("example bold")
              p cell.inner_html    
   	      p "zazazazaazazazazazzaz"	    
        card = cardold[cardold.length-1]
        card.example = cell.inner_text
        
        p card 
        p "this is card"
        card.save
       	
      else  
       i = i+1 
       p "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasssssssssssssssssssssssssssss"
       if i == 0
       card.card_name = cell.inner_text
	 p  "here i should get the imageeee"
	  (cell/"").each do |aa|
		        image = (aa/"a").inner_html.split("\"")[1] 
	                system("wget -nd -r -l 2 -t 2 -P #{Rails.root}/app/assets/images/  "+"http://www.choose.net"+image)
                        system("rm #{image}")   
			card.fetch_image_name = image
		 
		 
		end
	 
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
       if i==6
 	 
	 another_url =  (cell/"a").last.attributes['href'] if  !(cell/"a").last.blank?
         page = agent.get(another_url) if  !(cell/"a").last.blank?
         doc = Hpricot(page.content) if  !(cell/"a").last.blank?
         parse_detail_of_card(card,doc) if  !(cell/"a").last.blank?
         agent.back  if  !(cell/"a").last.blank?
         
        end
      end 
     
     end
    card.save
    cardold << card 
     
end
end

 def parse_detail_of_card(card,doc)
     (doc/"div.mainfeatures/div").each do |each_feature|
	 
	 card.features.new(:content=> each_feature.inner_text)
	 card.save
end
 
(doc/"table.details").each do |each_table|
   
  #p each_table.attributes
   if each_table.attributes.to_s.include?("details red")
	i=0
      (each_table/"tr").each do |each_tr|
	  i=i+1
		if i==2 
                         carddet = Carddetail.new			
			(each_tr/"th").each do |tdd|  
			 carddet.title=tdd.inner_text
			end
			  	
			 long_descr = ""	
			(each_tr/"td").each do |tdd|  
                             long_descr << tdd.inner_text + " "
			end
			carddet.long_desc = long_descr
			card.carddetails << carddet 
		        card.save
				
 		end	
	end 
   
   else
         (each_table/"tr").each do |each_tr|
		   carddet = Carddetail.new
	 	    (each_tr/"th").each do |each_th|
		          carddet.title=each_th.inner_text
			end   
			long_descr = ""
		    (each_tr/"td.lastcol").each do |each_td|
		   	 
			begin			
			  long_descr << each_td.inner_text + " " 
			 
			rescue
                         p "sometimes it gives utf encoding error"
			end
			end   
			carddet.long_desc = long_descr
			card.carddetails << carddet 
		        card.save  
	           		 
	 end
   end

end

 end	



end
