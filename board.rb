class Board
	def initialize x, y
		@current_level


		@x = x
		@y = y

		@board = Array.new(x){Array.new(y)}
		6.times do |y|
			8.times do |x|
				@board[x][y] = Tile.new(x*80, y*80, 0)
			end
		end
	end

	def reset
		unless @current_level.nil?
			@board = @current_level
		end
	end

	def randomize level

		(level * 5).times do
			x = rand(@x) - 1
			y = rand(@y) -1
			self.click(x,y)
		end
		@current_level = @board

	end

	def draw
		@board.each do |row|
			row.each do |tile|
				tile.draw
			end
		end
	end
	def click x, y
		for x_trans in -1..1 do
			for y_trans in -1..1 do
				new_x = x_trans + x
				new_y = y_trans + y
				if (x_trans.abs + y_trans.abs == 1) && (new_x >= 0 && new_y >= 0) && (new_x < @x && new_y < @y)
					@board[x+x_trans][y + y_trans].flip
				end
			end
		end
		
	end

	def all_white

		allWhite = true

		@board.each do |row|
			row.each do |tile|
				unless tile.is_white
					allWhite = false
				end
			end
		end

		return allWhite

	end
end