require 'open-uri'

class UriQueryController < ApplicationController
	def index
		page_url = "https://uva.onlinejudge.org/index.php?option=com_onlinejudge&Itemid=20&page=show_authorstats&userid=785687"
		page = Nokogiri::HTML(open(page_url))
		@questions_d1 = page.xpath("//table")
		page_url = "https://uva.onlinejudge.org/index.php?option=com_onlinejudge&Itemid=20&page=show_authorstats&userid=785641"
		page = Nokogiri::HTML(open(page_url))
		@questions_d2 = page.xpath("//table")
		page_url = "https://uva.onlinejudge.org/index.php?option=com_onlinejudge&Itemid=20&page=show_authorstats&userid=718101"
		page = Nokogiri::HTML(open(page_url))
		@questions_d3 = page.xpath("//table")
		#@questions = page.css('table:nth-child(3)')
	end
end
