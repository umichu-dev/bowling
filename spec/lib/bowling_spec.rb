require "bowling"	

describe "ボウリングのスコア計算" do
	before do
		@game = Bowling.new
	end
	describe "全体の合計" do
		context "全ての投球がガターだった場合" do
			it "0になること" do	
				add_many_scores(20,0)
				@game.calc_score
				expect(@game.total_score).to eq 0
			end
		end

		context "全ての投球で1ピンずつ倒した場合" do
			it "20になること" do
				add_many_scores(20,1)
				@game.calc_score
				expect(@game.total_score).to eq 20
			end
		end
		
		context "スペアを取った場合" do
			it "スペアボーナスが加算されること" do
				#第1フレームで3,7点スペア
				@game.add_score(3)
				@game.add_score(7)
				#第2フレーム1投で4点
				@game.add_score(4)
				#以降ガター
				@game.add_many_scores(17,0)
				#合計を計算
				@game.calc_score
				expect(@game.total_score).to eq 18
				
			end
		end
			

		context "フレーム違いでスペアになるようなスコアだった場合" do
			it "スペアボーナスが加算されること" do
				#第1フレームで3,5点
				@game.add_score(3)
				@game.add_score(5)
				#第2フレームで5,4点
				@game.add_score(5)
				@game.add_score(4)
				#以降ガター
				@game.add_many_scores(16,0)
				#合計を計算
				@game.calc_score
				expect(@game.total_score).to eq 17
				
			end
		end


		context "最終フレームでスペアを取った場合" do
			it "スペアボーナスが加算されないこと" do
				#第1フレームで3,7点スペア
				@game.add_score(3)
				@gamee.add_score(7)
				#第2フレーム1投で4点
				@game.add_score(4)
				#15投はすべてガター
				@game.add_many_scores(15,0)
				#最終フレームは3,7点
				@game.add_score(3)
				@game.add_score(7)
				@game.calc_score
				#合計を計算
				@game.calc_score
				expect(@game.total_score).to eq 28
				
			end
		end

	end

	private

	def add_many_scores(count,pins)
		count.times do
			@game.add_score(pins)
		end
	end

end
