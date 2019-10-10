require 'open-uri'
require 'nokogiri'
require 'pry'




def page_html
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	return page
end
	

def recup_symbols
	page = page_html 
	crypto_symbols = page.xpath('//*/td[2]/a')
	crypto_symbols_unlinked = crypto_symbols.map {|crypto_symbol| crypto_symbol.text}
	return crypto_symbols_unlinked

end


def recup_values 
	page = page_html
	crypto_values = page.xpath('//td[5]/a')
	crypto_values_unlinked = crypto_values.map {|crypto_value| crypto_value.text}
	return crypto_values_unlinked
	
end

Hash.class_eval do
def split_into(divisions)

    count = 0
    inject([]) do |final, key_value|
      final[count%divisions] ||= {}
      final[count%divisions].merge!({key_value[0] => key_value[1]})
      count += 1
      final
    end

end
end



def associate_symbols_values

	final_array = []
	crypto_symbols_unlinked = recup_symbols
  crypto_values_unlinked = recup_values

  crypto_currencies = Hash[crypto_symbols_unlinked.zip(crypto_values_unlinked)]

  final_array = crypto_currencies.split_into(crypto_symbols_unlinked.length) 

    puts final_array



end


associate_symbols_values















def associate_symbols_values_2

symbols = recup_symbols
values = recup_values

crypto_currencies = []
#crypto_currencies.inject([]){|symbol,value| symbol << {:key => symbols, :value => values} }
crypto_currencies.map {|email| {:key => symbols, :value => values} }

return crypto_currencies
puts crypto_currencies

end


def associate_symbols_values_3

	crypto_currencies = []

	crypto_symbols_unlinked = recup_symbols
	crypto_values_unlinked = recup_values

	#crypto_table = (crypto_symbols_unlinked , crypto_values_unlinked)

	crypto_currencies = crypto_table.each do |couple|
			couple = Hash[crypto_symbols_unlinked.zip(crypto_values_unlinked)]
			end


	puts crypto_currencies.map{ |k,v| "{ #{k} => #{v}} " }.sort

	#.map{ |k,v| "{ #{k} => #{v}} " }.sort
end
