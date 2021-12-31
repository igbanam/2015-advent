# frozen_string_literal: true

# --- Day 12: JSAbacusFramework.io ---

require 'debug'
require 'json'

filename = $PROGRAM_NAME.gsub(/\.rb$/, '')
input = File.readlines("./#{filename}.in", chomp: true)[0]
grand_node = JSON.parse(input)

def sum_node(node)
  return node if node.is_a?(Integer)
  return 0 if node.empty?

  if node.is_a?(Hash)
    return 0 if node.values.any? { |v| v == 'red' }

    node.values.sum { |v| sum_node(v) }
  elsif node.is_a?(Array)
    node.sum { |v| sum_node(v) }
  elsif node.is_a?(String)
    0
  else
    node.reduce(0) do |sum, n|
      sum + n.map do |v|
        v.is_a?(Integer) ? v : sum_node(v)
      end.sum
    end
  end
end

puts sum_node(grand_node)
