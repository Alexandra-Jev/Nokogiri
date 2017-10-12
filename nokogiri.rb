#!/usr/bin/ruby
require 'ruby gems'
require 'open-uri'
require 'nokogiri'

def get_the_email_of_a_townhal_from_its_webpage
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
	email = page.xpath('//table/tr[3]/td/table/tr[1]/td[1]/table[4]/tr[2]/td/table/tr[4]/td[2]/p/font')
	
		#puts email.text
		email.text
end

get_the_email_of_a_townhal_from_its_webpage

def get_all_the_urls_of_val_doise_townhalls
doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	towns_mail_list = Hash.new()
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	page.xpath('//table/tr[2]/td/table/tr/td/p/a').each do |town|
		town_name = town.text.downcase
		proper_town_name = town_name.capitalize
		town_name = town_name.split(' ').join('-')
		url = "http://annuaire-des-mairies.com/95/#{town_name}.html"
		towns_mail_list[proper_town_name.to_sym] = get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/95/#{town_name}.html")
	end
	towns_mail_list.each do |key, value|
			puts "#{key}: #{value} "
	end
end
get_all_the_urls_of_val_doise_townhalls(VAL_DOISE_URL)
#get_the_email_of_a_townhal_from_its_webpage(TOWN_URL)


