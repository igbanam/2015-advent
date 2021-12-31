# frozen_string_literal: true

# --- Day 13: Knights of the Dinner Table ---

require 'debug'

filename = $PROGRAM_NAME.gsub(/\.rb$/, '')
input = File.readlines("./#{filename}.in", chomp: true)

# Edge.
#
# @param [String] from
# @param [String] weight
# @param [Integer] weight
class Edge
  attr_reader :from, :to, :weight

  def initialize(from, to, weight)
    @from = from
    @to = to
    @weight = weight
  end

  def <=>(other)
    weight <=> other.weight
  end

  def to_s
    "#{from} -> #{to} (#{weight})"
  end

  def inspect
    to_s
  end

  def self.from_string(string)
    string.scan /(\w+) would (gain|lose) (\d+) happiness units by sitting next to (\w+)/ do |from, sign, weight, to|
      weight = weight.to_i * (sign == 'gain' ? 1 : -1)
      return new(from, to, weight)
    end
  end
end

# Graph.
#
# @param [Array<Edge>] edges
class Graph
  attr_accessor :edges
  attr_reader :nodes

  def initialize(edges)
    @edges = edges
    remap_nodes!
  end

  def to_s
    edges.map(&:to_s).join("\n")
  end

  def inspect
    to_s
  end

  def self.from_string(string)
    edges = string.split("\n").map { |line| Edge.from_string(line) }
    new(edges)
  end

  def remap_nodes!
    @nodes = edges.map(&:from).uniq.push(*edges.map(&:to)).uniq
  end
end

graph = Graph.from_string(input.join("\n"))

# debugger

happiness = graph.nodes.permutation.map do |perm|
  perm.reduce(0) do |sum, node|
    leftward = graph.edges.find do |edge|
      edge.from == node && edge.to == perm[(perm.index(node) - 1) % perm.size]
    end
    rightward = graph.edges.find do |edge|
      edge.from == node && edge.to == perm[(perm.index(node) + 1) % perm.size]
    end
    sum + leftward.weight + rightward.weight
  end
end

puts happiness.max
