#!/bin/ruby

require 'json'
require 'stringio'

# Complete the hourglassSum function below.
def hourglassSum(arr)
    highest = nil
    for i in 0..(arr.count/2)
        for j in 0..(arr.first.count/2)
            total_sum = [
                arr[i][j], arr[i][j+1],
                arr[i][j+2], arr[i+1][j+1],
                arr[i+2][j], arr[i+2][j+1],
                arr[i+2][j+2]            
            ].sum
            highest = total_sum if (highest.nil? || (highest < total_sum))            
        end
    end
    return highest

end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

arr = Array.new(6)

6.times do |i|
    arr[i] = gets.rstrip.split(' ').map(&:to_i)
end

result = hourglassSum arr

fptr.write result
fptr.write "\n"

fptr.close()