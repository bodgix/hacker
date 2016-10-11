#!/usr/bin/env ruby


def read_data(io)
  data = {}
  data[:s], data[:t] = io.gets.strip.split(' ')
  data[:s] = data[:s].to_i
  data[:t] = data[:t].to_i

  data[:a], data[:b] = io.gets.strip.split(' ')
  data[:a] = data[:a].to_i
  data[:b] = data[:b].to_i

  data[:m], data[:n] = io.gets.strip.split(' ')
  data[:m] = data[:m].to_i
  data[:n] = data[:n].to_i

  data[:apple] = io.gets.strip
  data[:apple] = data[:apple].split(' ').map(&:to_i)

  data[:orange] = io.gets.strip
  data[:orange] = data[:orange].split(' ').map(&:to_i)

  data
end

def fruit_on_roof?(fruit_type, data, d)
  case fruit_type
  when :apple then data[:a] + d >= data[:s] && data[:a] + d <= data[:t]
  when :orange then data[:b] + d <= data[:t] && data[:b] + d >= data[:s]
  end
end

data = read_data(STDIN)
result = Hash.new(0)

[:apple, :orange].each do |fruit_type|
  data[fruit_type].each do |drop_point|
    result[fruit_type] += 1 if fruit_on_roof?(fruit_type, data, drop_point)
  end
end

puts result[:apple]
puts result[:orange]
