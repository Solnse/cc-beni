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
       iname = ""
       if !(carddiv/"div.CardDetails/div.leftDetail/div/a/img")[0].to_s.blank?
          iname = (carddiv/"div.CardDetails/div.leftDetail/div/a/img")[0].attributes['src'].split("/").last
       
       system("wget -nd -r -l 2 -t 2 -P #{Rails.root}/app/assets/images/ -A jpeg,jpg,bmp,gif,png "+(carddiv/"div.CardDetails/div.leftDetail/div/a/img")[0].attributes['src'])
     
       system("rm #{iname}")
       else
	 p "there is no image src"
       end
    card.fetch_image_name = iname
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
