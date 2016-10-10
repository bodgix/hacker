#!/usr/bin/env ruby
# encoding: UTF-8

CMD_ADD = 1
CMD_DEL = 2
CMD_PRINT = 3


numbers = Hash.new(0)
max = []
stack = []
n = nil

def remove(stack, numbers, max)
  x = stack.pop
  if (numbers[x] -= 1) == 0
    if x == max.last
      max.pop
    end
  end
end

def print_max(max)
  puts max.last
end

def add(x, stack, numbers, max)
  stack << x
  numbers[x] += 1
  add_max(x, max)
end

def add_max(x, max)
  unless max.last
    max << x
  else
    max << x if x > max.last
  end
end

STDIN.each do |line|
  line.chomp!
  unless n
    n = line
    next
  end

  command, x = line.split

  case command.to_i
  when CMD_ADD then add(x.to_i, stack, numbers, max)
  when CMD_DEL then remove(stack, numbers, max)
  when CMD_PRINT then print_max(max)
  end
end
