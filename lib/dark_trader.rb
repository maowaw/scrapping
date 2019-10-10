require 'open-uri'
require 'nokogiri'


def page_html
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	return page
end
	

def recup_symbols
	page = page_html 
	crypto_symbols = page.xpath('//*/td[2]/a')
	crypto_symbols.each do |crypto_symbol| 
	crypto_symbols_unlinked = crypto_symbol.text.split
#	puts crypto_symbols_unlinked
return crypto_symbols_unlinked
	end

end



def recup_values 
	page = page_html
	crypto_values = page.xpath('//td[5]/a')
	crypto_values = crypto_values.each do |crypto_value|
	crypto_values_unlinked = crypto_value.text.split
#	puts crypto_values_unlinked
		return crypto_values_unlinked
	end

end



def associate_symbols_values
	crypto_currencies = Hash.new
	crypto_symbol_unlinked = recup_symbols
	crypto_values_unlinked = recup_values
	crypto_currencies = crypto_symbol_unlinked.zip(crypto_values_unlinked)
	puts crypto_currencies

end

associate_symbols_values