# frozen_string_literal: true

# --- Day 3: Perfectly Spherical Houses in a Vacuum ---

require 'debug'

filename = $PROGRAM_NAME.gsub(/\.rb$/, '')
input = File.readlines("./#{filename}.in", chomp: true)[0].chars

@visited = []
@visited << [0, 0]

def part1(input)
  input.each do |dir|
    case dir
    when '^'
      @visited << [@visited.last[0], @visited.last[1] + 1]
    when 'v'
      @visited << [@visited.last[0], @visited.last[1] - 1]
    when '>'
      @visited << [@visited.last[0] + 1, @visited.last[1]]
    when '<'
      @visited << [@visited.last[0] - 1, @visited.last[1]]
    end
  end
  @visited.uniq.count
end

puts part1(input)
