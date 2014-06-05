class Rover
	attr_accessor :x, :y, :facing

	def initialize(x, y, facing)
		@x = x
		@y = y
		@facing = facing
	end
end

rover1 = Rover.new(1, 2, "N")

rover2 = Rover.new(3, 3, "E")

p rover1
p rover2