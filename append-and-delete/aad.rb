#!/usr/bin/env ruby

def read_data(stream)
  target = stream.gets.strip.chomp
  src = stream.gets.strip.chomp
  k = stream.gets.strip.to_i
  {
    target: target,
    source: src,
    k: k
  }
end

def check_string(target, src, k)
  return false if k < 0
  parts = target.partition(/^#{src}/)

  # If there's a match
  if parts[1] != ''
    # If there are the same missing characters as the remaining moves
    return true if parts[2].length == k
    return check_string(target, src.chop, k - 1)
  # there's no match but we've an empty src already
  else
    # we've an empty string already
    if src == ''
      return true if parts[0].length == k
    end
    # we try chopping
    return check_string(target, src.chop, k - 1)
  end
end

data = read_data(STDIN)

if check_string(data[:target], data[:source], data[:k])
  puts 'Yes'
else
  puts 'No'
end
