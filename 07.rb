# frozen_string_literal: true

# --- Day 7: Some Assembly Required ---

require 'debug'

filename = $PROGRAM_NAME.gsub(/\.rb$/, '')
@input = File.readlines("./#{filename}.in", chomp: true)

@store = {}
old_sync = $stdout.sync
$stdout.sync = true

def can_operate?(a, b = nil)
  return @store[a.to_sym] && @store[b.to_sym] if b

  @store[a.to_sym]
end

def synthesize(index, a, b = nil, &block)
  if b
    if can_operate?(a, b)
      yield
      @input.delete_at(index)
    end
  else
    if can_operate?(a)
      yield
      @input.delete_at(index)
    end
  end
end

def evaluate(line, index)
  debugger if @input.size == 319
  expression, destination = line.split(' -> ')
  case expression.split(' ')
  in [signal]
    @store[destination.to_sym] = signal.to_i
    @input.delete_at(index)
  in [left, 'AND', right]
    if can_operate?(left, right)
      @store[destination.to_sym] = (@store[left.to_sym] & @store[right.to_sym]) & 65535
      @input.delete_at(index)
    end
  in [left, 'OR', right]
    if can_operate?(left, right)
      @store[destination.to_sym] = (@store[left.to_sym] | @store[right.to_sym]) & 65535
      @input.delete_at(index)
    end
  in [left, 'LSHIFT', right]
    if can_operate?(left)
      @store[destination.to_sym] = (@store[left.to_sym] << right.to_i) & 65535
      @input.delete_at(index)
    end
  in [left, 'RSHIFT', right]
    if can_operate?(left)
      @store[destination.to_sym] = (@store[left.to_sym] >> right.to_i) & 65535
      @input.delete_at(index)
    end
  in ['NOT', right]
    if can_operate?(right)
      @store[destination.to_sym] = (~@store[right.to_sym]) & 65535
      @input.delete_at(index)
    end
  end
end

while @input.any?
  @input.each_with_index do |line, i|
    evaluate(line, i)
  end
end

puts @store.inspect

$stdout.sync = old_sync
