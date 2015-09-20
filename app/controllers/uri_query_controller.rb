require 'open-uri'

class UriQueryController < ApplicationController
	def index

		@players = []

		update_player "718101", @players, "Duente_1"
		update_player "785641", @players, "Duente_2"
		update_player "785687", @players, "Duente_3"

		@players.sort!
	end

	def get_data (url)
		page = Nokogiri::HTML(open(url))
		return page.xpath("//div[contains(@align, 'center')]/table/tr/td/h1/text()").collect {|node| node.text.strip}
	end

	def update_player (id, array, name)
		if(player = Player.find_by_id(id))
			data = get_data "https://uva.onlinejudge.org/index.php?option=com_onlinejudge&Itemid=20&page=show_authorstats&userid=#{id}"
			player.update(:name => name, :submissions => data[0], :tried => data[1], :solved => data[2],
			:last_sub => data[4])
			player.save!
			array << player
		else
			data = get_data "https://uva.onlinejudge.org/index.php?option=com_onlinejudge&Itemid=20&page=show_authorstats&userid=#{id}"
			player = Player.new(:id => id, :name => name, :submissions => data[0], :tried => data[1], :solved => data[2],
			:first_sub => data[3], :last_sub => data[4])
			player.save!
			array << player
		end

	end
end
