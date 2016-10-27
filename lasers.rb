# I ran out of time
# .. but I was only doing this for fun and practice
# .. please don't waste you time giving me feedback :]
# not working

class Room
    attr_accessor :width, :height, :layout, :laser
    
    def initialize(width, height, layout)
        @width = width
        @height = height
        @layout = Array.new
        for i in (0..layout.length)
            @layout[i] = Cell.new(layout[i])
        end
        @laser = Laser.new(layout.index("@"))
    end
end

class Cell
    attr_accessor :item, :visited, :last_dir
    
    def initialize(item)
        @item = item
        @visited = false
        @last_dir = nil
        
        if @item == "@"
            @visited = true
        end
    end
    
    def seen(dir) 
        @visited = true
        @last_dir = dir
    end
    
    def is_loop(dir)
        if @visted && @last_dir == dir
            return true
        end
        
        return false
    end
end

class Laser
    attr_accessor :direction, :position
    
    def initialize(position)
        @direction = 0
        @position = position
    end
    
    def valid_step(width, height)
        if @direction == 0 && @position % width == width - 1
            return false
        elsif @direction == 90 && @position < width
            return false
        elsif @direction == 180 && @position % width == 0
            return false
        elsif @direction == 270 && @position >= (width - 1) * height
            return false
        else
            return true
        end
    end

    def step(width)
        case @direction
            when 0
                @position+=1
            when 90
                @position-=width
            when 180
                @position-=1
            when 270
                @position+=width
        end
    end
            
    def update_direction(value)    
        case value
            when "^"
                @direction = 90
            when ">"
                @direction = 0
            when "<"
                @direction = 180
            when "v"
                @direction = 270
            when "/"
                if @direction == 0 || @direction == 180
                    @direction+=90
                else
                    @direction-=90
                end
            when "\\"
                if @direction == 0
                    @direction+=270
                elsif @direction == 180
                    @direction-=90
                elsif @direction == 270
                    @direction = 0
                elsif @direciton == 90
                    @direction = 180
                end
            when "o"
                @direction = (@direction + 180) % 360
            else #"@"#"-"
        end
    end
end

class LaserWalk
    def run
        height = 0
        line = gets
        width = line.length - 1
        arr = Array.new
        while (line)
            arr.push(*line.strip().split(""))
            height+=1;
            line = gets
        end
        room = Room.new(width, height, arr)
        distance = 1
        in_loop = false
        while !in_loop && room.laser.valid_step(room.width, room.height)
            room.laser.step(room.width)
            room.laser.update_direction(room.layout[room.laser.position].item)
            if room.layout[room.laser.position].visited && room.laser.valid_step(room.width, room.height) 
                in_loop = true
            end
            room.layout[room.laser.position].seen(room.laser.direction)
            distance+=1
        end

        if in_loop
            puts -1
        else
            puts distance
        end
    end
end

LaserWalk.new.run




 

    
