#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'countingValleys' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER steps
#  2. STRING path
#

def countingValleys(steps, path)
    # Write your code here
    level = 0
    count = 0
    i = 0
    while i < steps do
      if path[i] == "D"
        level-=1     
      else        
        count+=1 if (level + 1) == 0
        level+=1
      end
      i+=1
    end
    return count
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

steps = gets.strip.to_i

path = gets.chomp

result = countingValleys steps, path

fptr.write result
fptr.write "\n"

fptr.close()