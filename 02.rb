# frozen_string_literal: true

# --- Day 2: I Was Told There Would Be No Math ---

require 'debug'

filename = $PROGRAM_NAME.gsub(/\.rb$/, '')
input = File.readlines("./#{filename}.in", chomp: true)

def surface_area(l, w, h)
  2 * l * w + 2 * w * h + 2 * h * l + [l * w, w * h, h * l].min
end

def part_one(input)
  input.map { |line| line.split('x').map(&:to_i) }
       .map { |l, w, h| surface_area(l, w, h) }
       .sum
end

puts part_one(input)
