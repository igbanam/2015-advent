# frozen_string_literal: false

# --- Day 11: Corporate Policy ---

require 'debug'

filename = $PROGRAM_NAME.gsub(/\.rb$/, '')
input = 'vzbxkghb'

def includes_increasing_straight?(password)
  password.chars.map(&:ord).each_cons(3).select do |a, b, c|
    a + 1 == b && b + 1 == c
  end.any?
end

def includes_iol?(password)
  password.each_char.any? { |c| %w[i o l].include?(c) }
end

def includes_non_overlapping_pairs?(password)
  password.chars.each_cons(2).select { |a, b| a == b }.size >= 2
end

def valid?(password)
  includes_increasing_straight?(password) &&
    !includes_iol?(password) &&
    includes_non_overlapping_pairs?(password)
end

i = 0
loop do
  input.succ!
  if valid?(input)
    i += 1
    puts input
  end
  break if i >= 10
end
