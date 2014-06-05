class Rover
	BEARINGS = %w[N E S W]
	attr_accessor :x, :y
	attr_accessor :bearing

	def initialize(x, y, bearing)
		@x = x
		@y = y
		@bearing = bearing
	end

	def process_commands(commands)
		commands.each_char do |command|
			case command
			when "L", "R" then change_direction(command) 		# case statement needs , not ||
			when "M" then move
			else puts "ERROR"
			end
		end
		self									# return self so we can do method chain and call upon its own instance, better than inputting a string
	end

	def change_direction(turn_direction)
		current_bearing = BEARINGS.index(@bearing)
		if turn_direction == "R"
			current_bearing += 1
		else
			current_bearing -= 1
		end
		current_bearing = current_bearing % 4

		@bearing = BEARINGS[current_bearing]
	end

	def move
		case @bearing
		when "N" then @y += 1					# can do @y or #{y}
		when "E" then @x += 1
		when "S" then @y -= 1
		when "W" then @x -= 1
		end
	end

	def to_s													# default method of to_s in ruby is returning an address
		"(#{@x}, #{@y}); #{@bearing}"		# need to write your own message to return output
	end
end
	

rover1 = Rover.new(1, 2, "N")
rover2 = Rover.new(3, 3, "E")


puts rover1.process_commands("LMLMLMLMM")
puts rover2.process_commands("MMRMMRMRRM")

#when "puts rover 1" it actually returns log rover1.to_s
