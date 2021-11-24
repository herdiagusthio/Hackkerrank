#!/bin/ruby

require 'json'
require 'stringio'



n = gets.to_i

arr = gets.rstrip.split(' ').map(&:to_i)

rev_arr = arr.reverse()
rev_arr.each_with_index do |v, i|
    if (i != (rev_arr.length - 1)) then print "#{v} " else print v end
end