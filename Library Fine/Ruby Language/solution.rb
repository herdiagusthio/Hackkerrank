#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'libraryFine' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER d1
#  2. INTEGER m1
#  3. INTEGER y1
#  4. INTEGER d2
#  5. INTEGER m2
#  6. INTEGER y2
#

def libraryFine(d1, m1, y1, d2, m2, y2)
    # Write your code here
    if y1 != y2
        return 10000 if y1 > y2
    else
        if m1 != m2
            return 500 * (m1-m2) if m1 > m2
        else
            return 15 * (d1-d2) if d1 > d2
        end
    end
    
    return 0
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

first_multiple_input = gets.rstrip.split

d1 = first_multiple_input[0].to_i

m1 = first_multiple_input[1].to_i

y1 = first_multiple_input[2].to_i

second_multiple_input = gets.rstrip.split

d2 = second_multiple_input[0].to_i

m2 = second_multiple_input[1].to_i

y2 = second_multiple_input[2].to_i

result = libraryFine d1, m1, y1, d2, m2, y2

fptr.write result
fptr.write "\n"

fptr.close()
