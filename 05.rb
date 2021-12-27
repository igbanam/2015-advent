# frozen_string_literal: true

# --- Day 5: Doesn't He Have Intern-Elves For This? ---

require 'debug'

filename = $PROGRAM_NAME.gsub(/\.rb$/, '')
input = File.readlines("./#{filename}.in", chomp: true)

def count_vowels(str)
  str.count('aeiou')
end

def count_double_letters(str)
  str.chars.each_cons(2).select { |a, b| a == b }.count
end

def melodious?(str)
  count_vowels(str) >= 3
end

def jitters?(str)
  count_double_letters(str) >= 1
end

def no_specifics?(str)
  !str.include?('ab') &&
    !str.include?('cd') &&
    !str.include?('pq') &&
    !str.include?('xy')
end

def nice?(str)
  melodious?(str) &&
    jitters?(str) &&
    no_specifics?(str)
end

puts "Part 1: #{input.map(&method(:nice?)).select(&:itself).count}"
