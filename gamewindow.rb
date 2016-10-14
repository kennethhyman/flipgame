require 'gosu'
load 'mouseobject.rb'
load 'tile.rb'
load 'board.rb'

class GameWindow < Gosu::Window
	

	def initialize
		@level = 1
		super 640, 480, {:fullscreen => false}
		
		@board = Board.new(8, 6)

		self.caption = "Gosu is cool!"
		@mouse = MouseObject.new(self.mouse_x, self.mouse_y)

		@board.randomize @level	
	end
	
	def update
		@mouse.update

		@mouse.warp self.mouse_x, self.mouse_y
		if button_down?(Gosu::MsLeft) && @mouse.can_click?
			@mouse.click
			@board.click((self.mouse_x/80).floor, (self.mouse_y/80).floor)

			if @board.all_white
				@level += 1
				puts @level.to_s

				@board.randomize  @level
			end
		end
		if button_down?(Gosu::KbSpace)
			@board.reset
		end

	end

	def draw
		@board.draw
		@mouse.draw

	end

end

window = GameWindow.new


window.show