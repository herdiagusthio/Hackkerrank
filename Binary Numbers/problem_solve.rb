#!/bin/ruby

require 'json'
require 'stringio'

n = gets.to_i

bn = n.to_s(2)

count = 0
pointer = 0
i = 0
while i < bn.length
    if bn[i] == "1"
        pointer += 1
        count = pointer if count < pointer
    else
        pointer = 0
    end
    i+=1
end
puts count