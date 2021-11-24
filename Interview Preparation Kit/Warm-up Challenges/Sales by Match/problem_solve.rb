#!/bin/ruby

require 'json'
require 'stringio'

# Complete the sockMerchant function below.
def sockMerchant(n, ar)
    i = 0
    count = 0
    ar = ar.sort
    while i < n
      if i+1 < n
        if ar[i] == ar[i+1]
          count+=1
          i+=1
        end
      end
      i+=1
    end
    return count
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

ar = gets.rstrip.split(' ').map(&:to_i)

result = sockMerchant n, ar

fptr.write result
fptr.write "\n"

fptr.close()