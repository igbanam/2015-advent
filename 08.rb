# frozen_string_literal: true

# --- Day 6: Probably a Fire Hazard ---

require 'debug'

filename = $PROGRAM_NAME.gsub(/\.rb$/, '')
input = File.readlines("./#{filename}.in", chomp: true)

puts input.map { |line| line.size - eval(line).size }.sum
