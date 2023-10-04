#!/usr/bin/env ruby

input = ARGV[0]

res1 = input.scan(/\[from:(.*?)\]/).join
res2 = input.scan(/\[to:(.*?)\]/).join
res3 = input.scan(/\[flags:(.*?)\]/).join

puts "#{res1},#{res2},#{res3}"
