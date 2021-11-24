#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'hurdleRace' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER k
#  2. INTEGER_ARRAY height
#

def hurdleRace(k, height)
    # Write your code here
    doses = 0
    left = 0
    right = height.size - 1
    while left <= right do
        if height[left] > k
            doses = height[left] - k if doses < height[left] - k
        end
        
        if height[right] > k
            doses = height[right] - k if doses < height[right] - k
        end
        
        left += 1
        right -= 1
    end
    
    return doses
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

first_multiple_input = gets.rstrip.split

n = first_multiple_input[0].to_i

k = first_multiple_input[1].to_i

height = gets.rstrip.split.map(&:to_i)

result = hurdleRace k, height

fptr.write result
fptr.write "\n"

fptr.close()
