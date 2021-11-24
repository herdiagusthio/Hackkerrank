#!/bin/ruby

require 'json'
require 'stringio'

# Complete the jumpingOnClouds function below.
def jumpingOnClouds(c)
    i = 0
    count = 0
    while i < c.count do
        if c[i+2] == 0
            count+=1
            i+=1
        else
            count+=1 if c[i+1] == 0
        end       
        i+=1   
    end
    return count
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

c = gets.rstrip.split(' ').map(&:to_i)

result = jumpingOnClouds c

fptr.write result
fptr.write "\n"

fptr.close()