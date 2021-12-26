# frozen_string_literal: true

# --- Day 2: I Was Told There Would Be No Math ---

require 'debug'

filename = $PROGRAM_NAME.gsub(/\.rb$/, '')
input = File.readlines("./#{filename}.in", chomp: true)
            .map { |line| line.split('x').map(&:to_i) }

def surface_area(l, w, h)
  2 * l * w + 2 * w * h + 2 * h * l + [l * w, w * h, h * l].min
end

def ribbon(dimensions)
  dimensions.reduce(:*) + dimensions.sort[0, 2].sum * 2
end

def part_one(input)
  input.map { |l, w, h| surface_area(l, w, h) }.sum
end

def part_two(input)
  input.map { |d| ribbon(d) }.sum
end

puts part_one(input)
puts part_two(input)
