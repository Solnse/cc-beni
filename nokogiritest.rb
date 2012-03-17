    require 'rubygems'  
    require 'nokogiri'  
    require 'open-uri'  
    require 'rubygems'
    
    	
    url = "http://www.moneysupermarket.com/credit-cards/productlistinggadget/?productSelection=All+Cards&viewFragment=Product-listing-prd-bt-prc-rwd-apr-wch&showTopCards=false&numberOfDisplayedProducts=25"  

count=1

url = "http://www.moneysupermarket.com/credit-cards/"

    doc = Nokogiri::HTML(open(url))  
    
   
 doc.css("tbody").each do |item| 

    doc.css(".tab-row").each do |item|  
      card_name = item.at_css(".provider").text  
      description = item.at_css(".product-name-tab ,.clickable-tab,.product").text  
      tabone = item.at_css(".balance-transfer-tab  ,.clickable-tab p").text 
      tabtwo = item.at_css(".purchases-tab ,.clickable-tab p").text
      tabthree = item.at_css(".rewards-tab, .clickable-tab p").text	
      tabfour = item.at_css(".apr-tab, .clickable-tab p").text		    
      tabfive = item.at_css(".reviews-tab").text		    
 		
    	 
       #puts "card name #{card_name} "
       #puts "card description #{description}"
       	
    	#puts "tabone #{tabone}"
     	#puts "tabtwo #{tabtwo}"
     	#puts "tabthree #{tabthree}"
     	#puts "tabfour #{tabfour}"
     	#puts "tabfive #{tabfive}"
     	
       end
    doc.css(".info").each do |item|  
 
	    features = item.at_css(".features,.positive").text
	    tabonedesc = item.at_css(".balance-transfer-tab-details,.expandable").text	
	    tabtwodesc = item.at_css(".purchases-tab-details,.expandable").text  
	    tabthreedesc = item.at_css(".rewards-tab-details,.expandable").text	
            tabfourdesc = item.at_css(".apr-tab-details,.expandable").text
	    tabfivedesc = item.at_css(".reviews-tab-details,.expandable")
           # puts features
            #puts tabonedesc
           # puts tabtwodesc
            puts tabthreedesc
	   # puts tabfourdesc
            #puts tabfivedesc

	     
  
    end 

 doc.css(".representative-example-text").each do |item|
	
    end 	
count=count+1
p "hhhhhhhhhhhhhhhhhhhhhhhhhhhhh#{count}"
   end
    # doc.css("#see-all").push	 
    #doc.css(".tab-row").each do |item|  
    #  text = item.at_css(".provider").text  
    #   puts "#{text} "
  
    #end	
