#!/usr/bin/env ruby

def read_data(stream)
  n, m = stream.gets.strip.split(' ').map(&:to_i)
  a = stream.gets.strip.split(' ').map(&:to_i)
  b = stream.gets.strip.split(' ').map(&:to_i)
  {
    n:  n,
    m:  m,
    a:  a,
    b:  b
  }
end

def factors(number)
  f = []
  (1 .. number).each do |num|
    f << num if number % num == 0
  end
  f
end

def factor?(num, factor)
  num % factor == 0
end

def factors_set(set)
  rs = set.sort
  fs = factors(rs.pop)

  fs.delete_if do |factor|
    val = rs.each do |number|
      unless factor?(number, factor)
        break true
      end
      false
    end
    true if val == true
  end
end

data = read_data(STDIN)
factors = factors_set(data[:b]).select do |factor|
  data[:a].each do |num|
    break false unless factor?(factor, num)
  end
end

puts factors.length
