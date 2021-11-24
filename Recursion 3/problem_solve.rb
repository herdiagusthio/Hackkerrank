#!/bin/ruby

require 'json'
require 'stringio'

# Complete the factorial function below.
def factorial(n)
    i = 1
    while i <= n
        i == 1 ? f = i : f = f * i
        i+=1
    end
    f
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

result = factorial n

fptr.write result
fptr.write "\n"

fptr.close()
