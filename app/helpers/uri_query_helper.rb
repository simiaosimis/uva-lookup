module UriQueryHelper
	class Player
		attr_accessor :questions, :name
		def initialize (_questions, _name)
			self.questions = _questions
			self.name = _name
		end

		def <=> (b)
			if(self.questions[5].size > b.questions[5].size)
				return 1
			elsif (self.questions[5].size < b.questions[5].size)
				return -1
			else
				return 0
			end
		end
	end
end
