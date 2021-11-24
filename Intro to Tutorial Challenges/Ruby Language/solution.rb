#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'introTutorial' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER V
#  2. INTEGER_ARRAY arr
#

def introTutorial(v, arr)
    # Write your code here
    left = 0
    right = arr.size - 1
    mid = getMid(left, right)
    result = 0
    while left < right do 
        if arr[mid] == v
            result = mid
            break
        end
        
        if arr[mid] > v
            right = mid
            mid = getMid(left, right)
        else
            left = mid
            mid = getMid(left, right) 
        end
        
    end
    
    return result
end

def getMid(left, right)
    diff = right + left
    mid = diff / 2
    mid += 1 if diff % 2 != 0
    
    return mid
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

V = gets.strip.to_i

n = gets.strip.to_i

arr = gets.rstrip.split.map(&:to_i)

result = introTutorial V, arr

fptr.write result
fptr.write "\n"

fptr.close()
