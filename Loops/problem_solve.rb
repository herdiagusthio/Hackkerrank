#!/bin/ruby

require 'json'
require 'stringio'



n = gets.to_i
if n > 1 && n < 21
  i=1
  begin
      puts "#{n} x #{i} = #{n*i}"
      i+=1
  end while i < 11
end