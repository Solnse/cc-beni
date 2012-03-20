task :fetch_cards4 => :environment do
 require 'rubygems'
 require 'mechanize'
 require 'hpricot'
stats_url = "http://www.indexcreditcards.com/creditcardlist.html"
  
   # instantiate/initialise web agent ..
   agent = Mechanize.new
  
     page = agent.get(stats_url)   
   doc = Hpricot(page.content)
   
(doc/"div.CardInfoDivPaid").each do |carddiv|
    card = Card.new
     
    card.card_name =  (carddiv/"span.CardName/a").inner_text
    card.card_type = "Visa"
     (carddiv/"div/ul/li").each do |litext|
        card.features.new(:content=> litext.inner_text)
        
	end
    cardd = ["Intro APR","Intro APR Period","Ongoing APR","Intro Bal. Transfer","Balance Transfer Fee","Credit Required"]
    i = -1
	
    (carddiv/"div/table/tr/th,td").each do |thtr|
       i=i+1
       card.carddetails.new(:title=>cardd[i],:short_desc=>thtr.inner_html)  
      end
      card.save
 end
end
