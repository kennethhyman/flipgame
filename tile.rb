load 'gameobject.rb'

class Tile < GameObject
	def initialize x, y, z
		 
		@images = [Gosu::Image.new('/home/kenbear/Documents/Programming/RubyPrograms/Games/FlipGame/Media/White.png'), Gosu::Image.new('/home/kenbear/Documents/Programming/RubyPrograms/Games/FlipGame/Media/Black.png')] 
		@state = 0
		@padding_x = 40
		@padding_y = 40
		super x, y, z, 0, @images[@state]

	end
	def flip
		if @state == 0
			@state = 1
		else
			@state = 0
		end
	end

	def draw
		@images[@state].draw_rot(@x + (@padding_x || 0), @y + (@padding_y || 0), @z, @rotation)
	end

	def is_white
		if @state == 0
			true
		else
			false
		end

	end

end