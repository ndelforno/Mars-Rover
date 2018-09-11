class Rover
  def initialize
    @x_coordinate = 1
    @y_coordinate = 2
    @direction = "N"
  end

 # Attribute Readers
  def x_coordinate
    return @x_coordinate
  end

  def y_coordinate
    return @y_coordinate
  end

  def direction
    return @direction
  end

  # Attribute Writers
  def read_instruction(message)
    message.each do |num|
      if num == "M"
        move
      elsif num == "R" || num == "L"
        turn(num)
      end
    end
  end

  def move
      if @direction == "N"
        @y_coordinate = @y_coordinate + 1
      elsif @direction == "S"
        @y_coordinate = @y_coordinate - 1
      elsif @direction == "E"
        @x_coordinate = @x_coordinate + 1
      elsif @direction == "E"
        @y_coordinate = @y_coordinate - 1
      end
  end

  def turn(num)
      if num == "R" && @direction == "N"
        @direction = "E"
      elsif num == "R" && @direction == "E"
        @direction = "S"
      elsif num == "R" && @direction == "S"
        @direction = "O"
      elsif num == "R" && @direction == "O"
        @direction = "N"
      elsif num == "L" && @direction == "N"
        @direction = "O"
      elsif num == "L" && @direction == "O"
        @direction = "S"
      elsif num == "L" && @direction == "S"
        @direction = "E"
      elsif num == "L" && @direction == "E"
        @direction = "N"
      end
  end
end
rover1 = Rover.new
message = ""
until message == "stop"
puts "What should we do ?"
message = gets.chomp.split("")
#puts message
rover1.read_instruction(message)

puts rover1.x_coordinate
puts rover1.y_coordinate
puts rover1.direction
end
