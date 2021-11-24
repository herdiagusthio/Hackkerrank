#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'dynamicArray' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts following parameters:
#  1. INTEGER n
#  2. 2D_INTEGER_ARRAY queries
#

def dynamicArray(n, queries)
    # Write your code here
    arr = Array.new(n) {Array.new}
    lastAnswer = 0
    result = Array.new
    queries.each do |q|
        if q[0] == 1
            idx = (q[1] ^ lastAnswer) % n
            arr[idx] += [q[2]]
        else
            idx = (q[1] ^ lastAnswer) % n
            lastAnswer = arr[idx][(q[2] % arr[idx].size)]
            result += [lastAnswer]
        end
    end
    return result
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

first_multiple_input = gets.rstrip.split

n = first_multiple_input[0].to_i

q = first_multiple_input[1].to_i

queries = Array.new(q)

q.times do |i|
    queries[i] = gets.rstrip.split.map(&:to_i)
end

result = dynamicArray n, queries

fptr.write result.join "\n"
fptr.write "\n"

fptr.close()
