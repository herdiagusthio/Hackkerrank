#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'beautifulDays' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER i
#  2. INTEGER j
#  3. INTEGER k
#

def beautifulDays(i, j, k)
    # Write your code here
    counter = 0 # variable to count beautiful day
    for n in i .. j do
        reverse_number = n.to_s.reverse.to_i
        sum = (n - reverse_number).abs
        counter += 1   if sum % k == 0
    end
    
    return counter
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

first_multiple_input = gets.rstrip.split

i = first_multiple_input[0].to_i

j = first_multiple_input[1].to_i

k = first_multiple_input[2].to_i

result = beautifulDays i, j, k

fptr.write result
fptr.write "\n"

fptr.close()