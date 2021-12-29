# frozen_string_literal: true

# --- Day 8: Matchsticks ---

require 'debug'

filename = $PROGRAM_NAME.gsub(/\.rb$/, '')
input = File.readlines("./#{filename}.in", chomp: true)

puts input.map { |line| line.inspect.size - line.size }.sum
