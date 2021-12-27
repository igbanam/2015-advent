# frozen_string_literal: true

# --- Day 3: Perfectly Spherical Houses in a Vacuum ---

require 'debug'

filename = $PROGRAM_NAME.gsub(/\.rb$/, '')
input = File.readlines("./#{filename}.in", chomp: true)[0].chars

def next_house(previous_house, direction)
  case direction
  when '^'
    [previous_house[0], previous_house[1] + 1]
  when 'v'
    [previous_house[0], previous_house[1] - 1]
  when '<'
    [previous_house[0] - 1, previous_house[1]]
  when '>'
    [previous_house[0] + 1, previous_house[1]]
  end
end

@santa = [[0, 0]]
@robo_santa = [[0, 0]]

def delivery(directions)
  directions.each_with_index do |dir, i|
    @santa << next_house(@santa.last, dir) if i.even?
    @robo_santa << next_house(@robo_santa.last, dir) if i.odd?
  end
  [@santa + @robo_santa].flatten(1).uniq.count
end

puts delivery(input)
