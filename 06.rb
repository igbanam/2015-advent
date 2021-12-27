# frozen_string_literal: true

# --- Day 6: Probably a Fire Hazard ---

require 'debug'

filename = $PROGRAM_NAME.gsub(/\.rb$/, '')
input = File.readlines("./#{filename}.in", chomp: true)

grid = Array.new(1000) { Array.new(1000, 0) }

def process(input)
  input.map.with_index do |line, i|
    instruction = line.split
    finish = instruction.last.split(',').map(&:to_i)
    if instruction.size.even?
      start = instruction[1].split(',').map(&:to_i)
      ['T', start, finish]
    else
      start = instruction[2].split(',').map(&:to_i)
      if instruction[1] == 'on'
        ['N', start, finish]
      elsif instruction[1] == 'off'
        ['F', start, finish]
      end
    end
  end
end

def light_show(instructions, grid)
  instructions.each do |instruction|
    case instruction[0]
    when 'N'
      (instruction[1][0]..instruction[2][0]).each do |x|
        (instruction[1][1]..instruction[2][1]).each do |y|
          grid[x][y] = grid[x][y] + 1
        end
      end
    when 'F'
      (instruction[1][0]..instruction[2][0]).each do |x|
        (instruction[1][1]..instruction[2][1]).each do |y|
          grid[x][y] = grid[x][y] - 1 if grid[x][y].positive?
        end
      end
    when 'T'
      (instruction[1][0]..instruction[2][0]).each do |x|
        (instruction[1][1]..instruction[2][1]).each do |y|
          grid[x][y] = grid[x][y] + 2
        end
      end
    end
  end
  grid.flatten.sum
end

puts light_show(process(input), grid)
