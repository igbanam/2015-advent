# frozen_string_literal: true

# --- Day 14: Reindeer Olympics ---

require 'debug'

filename = $PROGRAM_NAME.gsub(/\.rb$/, '')
input = File.readlines("./#{filename}.in", chomp: true)

# Reindeer.
#
# @param [String] name
# @param [Integer] speed
# @param [Integer] time active
# @param [Integer] time resting
class Reindeer
  attr_accessor :name, :speed, :active, :rest

  def initialize(name, speed, active, rest)
    @name = name
    @speed = speed
    @active = active
    @rest = rest
  end

  def distance_travelled(time)
    cycles_completed = time / cycle
    remaining_time = time % cycle
    cycles_completed * speed * active + [active, remaining_time].min * @speed
  end

  def cycle
    active + rest
  end
end

reindeers = input.map do |line|
  name = line.split(' ').first
  speed, active, rest = line.scan(/\d+/).map(&:to_i)
  Reindeer.new(name, speed, active, rest)
end

puts reindeers.map { |r| r.distance_travelled(2503) }.max

part2 = (1..2503).map do |time|
  distances_travelled = reindeers.map { |reindeer| reindeer.distance_travelled(time) }
  distances_travelled.map { |distance| distance / distances_travelled.max }
end.inject(Array.new(reindeers.size) { 0 }) { |acc, normalized_distance| acc.zip(normalized_distance).map { |a, b| a + b } }.max

puts part2
