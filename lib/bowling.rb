class Bowling
	def initialize
		@total_score = 0
		@scores = []
		@temp = []
		@frame_score = []
	end

	def total_score
		@total_score
	end
	#スコアを追加する
	def add_score(pins)
		@temp << pins
		if @temp.size == 2 || strike?(@temp)
			@socres << @temp
			@temp = []
		end
	end
	#スコアの合計を計算する
	def calc_score
		@scores.each.with_index(1) do |score,index|
			
			if strike?(score) && not_last_frame?(index)
				@total_score += calc_strike_bonus(index)
			elsif spare?(index) && not_last_frame?(index)
				@total_score += calc_spare_bonus(index)
			else
				@total_score += @scores.inject(:+)
			end
			@frame_score << @total_score
		end
	end
	
	def frame_score(frame)
		@frame_score[frame - 1]
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
	
	def strike?(score)
		score.first == 10
	end
	
	def calc_strike_bonus(index)
		if strike?(@scores[index]) && not_last_frame?(index + 1)
			20 + @scores[index + 1].first 
		else
			10 + @scores[index].inject[:+]
		end
	end

end
