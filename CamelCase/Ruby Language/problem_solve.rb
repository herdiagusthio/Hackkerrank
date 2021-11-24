#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'camelcase' function below.
#
# The function is expected to return an INTEGER.
# The function accepts STRING s as parameter.
#

def camelcase(s)
    # Write your code here
    result = 1
    s.each_char do |char|        
        result += 1 if char.ord < 91
    end
    
    return result
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.chomp

result = camelcase s

fptr.write result
fptr.write "\n"

fptr.close()
