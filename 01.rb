# frozen_string_literal: true

# --- Day 1: Not Quite Lisp ---

require 'debug'

filename = $PROGRAM_NAME.gsub(/\.rb$/, '')
input = File.readlines("./#{filename}.in", chomp: true)[0]
floor = 0
(0...input.size).each do |i|
  floor += 1 if input[i] == '('
  floor -= 1 if input[i] == ')'
end
puts floor
