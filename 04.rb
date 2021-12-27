# frozen_string_literal: true

# --- Day 4: The Ideal Stocking Stuffer ---

require 'debug'
require 'digest'

input = 'ckczppom'

def mine(secret)
  i = 0
  loop do
    i += 1
    md5 = Digest::MD5.hexdigest("#{secret}#{i}")
    return i if md5[0..5] == '00000'
  end
end

puts mine(input)
