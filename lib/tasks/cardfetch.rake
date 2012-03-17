 
desc "Fetch product prices"  
task :fetch_cards => :environment do  
      require 'rubygems'  
    require 'nokogiri'  
    require 'open-uri'  
    require 'rubygems'
    
    	 
 
url = "http://www.moneysupermarket.com/credit-cards/"
call_import_cards_data(url);
for i in 1..10
    url = "http://www.moneysupermarket.com/credit-cards/productlistinggadget/?productSelection=All+Cards&viewFragment=Product-listing-prd-bt-prc-rwd-apr-wch&showTopCards=false&numberOfDisplayedProducts=#{i*25}"  
    p "called url"  
    p i*25
     begin
      call_import_cards_data(url);
     rescue => e
       p "there is some errororoor"
       p e
       puts e
       puts url
     end
end

 
end 
def call_import_cards_data(url)
count=1


    doc = Nokogiri::HTML(open(url))  
 all_cards = []  
   
 doc.css("tbody").each do |item| 
 
          doc.css(".tab-row").each do |item|
            
         card = Card.new
    card.save
    all_cards << card
  
      card.card_name = item.at_css(".provider").text.split("\n")[1].strip
      p "card name"
      p card.card_name
      card.description = item.at_css(".product-name-tab ,.clickable-tab,.product").text.split("\n")[1].strip  
      #tabone = item.at_css(".balance-transfer-tab  ,.clickable-tab p").text 
      carddet = item.at_css(".balance-transfer-tab  ,.clickable-tab p").text
      
      card.carddetails.new(:title=>carddet.split("\n")[1].strip,:short_desc=>carddet.split("\n")[3]+carddet.split("\n")[5].strip) 
      	
      #tabtwo = item.at_css(".purchases-tab ,.clickable-tab p").text
      carddet = item.at_css(".purchases-tab ,.clickable-tab p").text
      p carddet
      card.carddetails.new(:title=>carddet.split("\n")[1].strip,:short_desc=>carddet.split("\n")[2].strip)
      #tabthree = item.at_css(".rewards-tab, .clickable-tab p").text	
      carddet = item.at_css(".rewards-tab, .clickable-tab p").text
      p carddet
      card.carddetails.new(:title=>carddet.split("\n")[2].strip)
     
      #tabfour = item.at_css(".apr-tab, .clickable-tab p").text		    
      carddet = item.at_css(".apr-tab, .clickable-tab p").text
      p carddet
      card.carddetails.new(:title=>carddet.split("\n")[1].strip,:short_desc=>carddet.split("\n")[2].strip)
     
      #tabfive = item.at_css(".reviews-tab").text		    
     
       card.carddetails.new(:title=>item.at_css(".small-review").text)
       card.example = doc.css(".representative-example-text p").text	
     		
    	 
       #puts "card name #{card_name} "
       #puts "card description #{description}"
       	
    	#puts "tabone #{tabone}"
     	#puts "tabtwo #{tabtwo}"
     	#puts "tabthree #{tabthree}"
     	#puts "tabfour #{tabfour}"
     	#puts "tabfive #{tabfive}"
     	 
       end
    i=-1   
    p "all cards"
    p all_cards
    doc.css(".info").each do |item|  
    i=i+1
    card = all_cards[i]
	    
	    features = item.at_css("product-name-tab-details-active,.features li").text
	    features.split("\n").each do |fe|
	         card.features.new(:content=>fe) if !fe.blank?	
	    end	
           	    #tabonedesc = item.at_css(".balance-transfer-tab-details,.expandable").text	
	    card.carddetails[0].long_desc = item.at_css(".balance-transfer-tab-details,.expandable").text.strip
		 

	    #tabtwodesc = item.at_css(".purchases-tab-details,.expandable").text  
	    card.carddetails[1].long_desc = item.at_css(".purchases-tab-details,.expandable").text.strip  
	    #tabthreedesc = item.at_css(".rewards-tab-details,.expandable").text	
            card.carddetails[2].long_desc = item.at_css(".rewards-tab-details,.expandable").text.strip	
	    #tabfourdesc = item.at_css(".apr-tab-details,.expandable").text
	   card.carddetails[3].long_desc = item.at_css(".apr-tab-details,.expandable").text.strip
	   #tabfivedesc = item.at_css(".reviews-tab-details,.expandable")
           card.carddetails[4].long_desc = item.at_css(".reviews-tab-details,.expandable").text.strip
	   # puts features
            #puts tabonedesc
           # puts tabtwodesc
           # puts tabthreedesc
	   # puts tabfourdesc
            #puts tabfivedesc

	     
       card.card_type = "Visa"
       card.save
     end 

 

  
count=count+1
   end
    
end	
