load 'gameobject.rb'

class MouseObject < GameObject
	def initialize x, y, clickdelay = 1.0
		super x, y, 2, 0, "/home/kenbear/Documents/Programming/RubyPrograms/Games/TowerDefenceGame/Media/mouse.png"
		@click_delay = clickdelay * 40
		@mouse_cooldown = 0 
							
	end


	def update
		unless @mouse_cooldown <= 0
			@mouse_cooldown -= 1
		end

	end

	def click
		@mouse_cooldown = @click_delay
	end
	def can_click?
		if @mouse_cooldown == 0
			true
		else
			false
		end
	end
end