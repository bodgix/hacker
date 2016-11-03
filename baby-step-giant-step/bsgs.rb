#!/usr/bin/env ruby

def read_data(stream)
  queries = []
  q = stream.gets.strip.to_i
  while line = stream.gets
    line.strip!
    a, b, d = line.split(' ').map(&:to_i)
    queries << { a: a, b: b, d: d }
  end
  {
    q:  q,
    queries:  queries
  }
end

def x_dist(args)
  args[:b][:x] - args[:a][:x]
end

def move(args)
  how_far = x_dist(a: args[:start], b: args[:dest])
  if how_far > (2 * args[:b]) # more than 2 big steps to go
    new_args = args
    new_args[:start][:x] = args[:start][:x] + args[:b]
    new_args[:moves] = args[:moves] + 1
    return move(new_args)
  elsif how_far == 0 # we're there - no need to move
    return args[:moves]
  elsif how_far == args[:a] || how_far == args[:b] # we're one big or one small step away
    return args[:moves] + 1
  else # we're closer than 2 big steps but no single step gets us there - we need to go along a triangle
    return args[:moves] + 2
  end
end

data = read_data(STDIN)

data[:queries].each do |query|
  puts move({
    a: query[:a],
    b: query[:b],
    start: {
      x: 0,
      y: 0
    },
    dest: {
      x: query[:d],
      y: 0
    },
    moves: 0
  })
end
