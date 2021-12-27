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

def double_unique?(str)
  front = str.chars.each_slice(2).map(&:join)
  back = str.reverse.chars.each_slice(2).map(&:join)

  return front.tally.values.any? { |v| v == 2 } if str.size.even?

  [front, back].flatten.tally.values.any? { |v| v == 2 }
end

def sandwich?(str)
  str.chars.each_cons(3).any? { |a, b, c| a == c && b != a }
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

def nicer?(str)
  sandwich?(str) && double_unique?(str)
end

def part_one(input)
  puts "Part 1: #{input.map(&method(:nice?)).select(&:itself).count}"
end

def part_two(input)
  puts "Part 2: #{input.map(&method(:nicer?)).select(&:itself).count}"
end

part_one(input)
part_two(input)
