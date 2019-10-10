require 'open-uri'
require 'nokogiri'
require 'pry'
require 'uri'
require 'rinku'

def page_html
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com//val-d-oise.html"))
	return page
end
	

def get_townhall_url
	
	page = page_html

	cities_link = page.css("a").select{|link| link['class'] == "lientxt"}
	cities = cities_link.map{|city| city.text}

	puts cities
	return cities

end


def get_townhall_email_test
		
		page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/avernes.html"))
    puts page.css('body > div > main > section:nth-child(2) > div > table > tbody > tr:nth-child(4) > td:nth-child(2)')
    
end

get_townhall_email_test

def get_townhall_email
	
	townhall_emails = []

	#Pour faire un array des URLs de toutes les villes (enlever les espaces et mettre l'adresse) :
	townhall_urls = get_townhall_url.map! {|e| e.gsub(" ", "-")}.map! {|city| '"https://www.annuaire-des-mairies.com/95/'+ city + '.html"' }
	puts townhall_urls
		

#   TEST DE MAPPAGE DE LA PAGE : page = townhall_urls.map! {|townhall_url|	 Nokogiri::HTML(open(townhall_url)) }
		
#   EN CSS : townhall_emails = townhall_url.css("a")[1].select{|link| link['class'] == "txt-primary tr-last"}
#		EN CSS SELECTOR : townhall_emails = page.css('body > div > main > section:nth-child(2) > div > table > tbody > tr:nth-child(4) > td:nth-child(2)')


	townhall_urls. each do |townhall_url| 
		page = Nokogiri::XML::Element(open(Rinku.auto_link(townhall_url)))
		townhall_emails << page.css('body > div > main > section:nth-child(2) > div > table > tbody > tr:nth-child(4) > td:nth-child(2)')
		end

		puts townhall_emails

end

get_townhall_email























def associate_cities_email

end
