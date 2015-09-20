require 'open-uri'

class UriQueryController < ApplicationController
	def index
		@players = []

		page_url = "https://uva.onlinejudge.org/index.php?option=com_onlinejudge&Itemid=20&page=show_authorstats&userid=718101"
		page = Nokogiri::HTML(open(page_url))

		@teste = page.xpath("//div[contains(@align, 'center')]/table/tr/td/h1/text()").collect {|node| node.text.strip}
		@player1 = Player.new(:submissions => @teste[0], :tried => @teste[1], :solved => @teste[2],
			:first_sub => @teste[3], :last_sub => @teste[4])
		@player1.save!

		page_url = "https://uva.onlinejudge.org/index.php?option=com_onlinejudge&Itemid=20&page=show_authorstats&userid=785641"
		page = Nokogiri::HTML(open(page_url))

		@teste = page.xpath("//div[contains(@align, 'center')]/table/tr/td/h1/text()").collect {|node| node.text.strip}
		@player2 = Player.new(:submissions => @teste[0], :tried => @teste[1], :solved => @teste[2],
			:first_sub => @teste[3], :last_sub => @teste[4])
		@player2.save!

		page_url = "https://uva.onlinejudge.org/index.php?option=com_onlinejudge&Itemid=20&page=show_authorstats&userid=785687"
		page = Nokogiri::HTML(open(page_url))

		@teste = page.xpath("//div[contains(@align, 'center')]/table/tr/td/h1/text()").collect {|node| node.text.strip}
		@player3 = Player.new(:submissions => @teste[0], :tried => @teste[1], :solved => @teste[2],
			:first_sub => @teste[3], :last_sub => @teste[4])
		@player3.save!

		@players << @player1
		@players << @player2
		@players << @player3


	end
end
