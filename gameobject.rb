class GameObject
	def initialize x, y, z, rotation, image
		@image = @image = Gosu::Image.new(image)
		@x = x
		@y = y
		@z = z
		@rotation = rotation
	end
	def warp(x, y)
		@x = x
		@y = y
	end
	def draw
		@image.draw_rot(@x + (@padding_x || 0), @y + (@padding_y || 0), @z, @rotation)
	end
end
