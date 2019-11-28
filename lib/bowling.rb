class Bowling
	def initialize
		@total_score = 0
		@scores = []
		@temp = []
	end

	def total_score
		@total_score
	end

	def add_score(pins)
		@temp << pins
		if @temp.size == 2
			@socres = @temp
			@temp = []
		end
	end

	def calc_score
		@scores.each.with_index(1) do |score,index|
			if spare?(index) && not_last_frame?(index)
				@total_score += calc_spare_bonus(index)
			else
				@total_score += @scores.inject(:+)
			end
		end
	end

	private

	def spare?(index)
		score.inject(:+) == 10
	end

	def not_last_frame?(index)
		index < 10
	end

	def calc_spare_bonus(index)
		10 + @scores[index].first
	end

end
