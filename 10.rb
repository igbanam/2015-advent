# frozen_string_literal: true

# --- Day 10: Elves Look, Elves Say ---

require 'debug'
require 'stringio'

filename = $PROGRAM_NAME.gsub(/\.rb$/, '')
# input = File.readlines("./#{filename}.in", chomp: true)
input = '1113222113'

# count chars in order
def count_chars(input)
  result = StringIO.new
  current_char = nil
  current_char_count = 0
  # debugger
  input.chars.each do |char|
    if current_char.nil?
      current_char = char
      current_char_count = 1
    else
      if char == current_char
        current_char_count += 1
      else
        result << "#{current_char_count}#{current_char}"
        current_char = char
        current_char_count = 1
      end
    end
  end
  result << "#{current_char_count}#{current_char}"
  result.string
end

50.times do
  input = count_chars(input)
end

puts input.length
