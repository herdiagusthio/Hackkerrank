#!/bin/ruby

require 'json'
require 'stringio'



N = gets.to_i


if N > 0 && N <= 100
    if N.odd? || (N.even? && (N >= 6 && N <= 20))
        puts "Weird"
    elsif N > 20 || (N.even? && (N >= 2 && N <= 5))
        puts "Not Weird"
    end
end