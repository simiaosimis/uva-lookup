class Player < ActiveRecord::Base
	def <=> (b)
		if(self.solved == b.solved)
			if(self.tried == b.tried)
				if(self.submissions == b.submissions)
					return 0
				end
			elsif (self.tried > b.tried)
				return -1
			else
				return 1
			end
		elsif (self.solved > b.solved)
			return -1
		else
			return 1
		end
	end
end
