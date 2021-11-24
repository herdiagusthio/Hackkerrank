#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'insertionSort1' function below.
#
# The function accepts following parameters:
#  1. INTEGER n
#  2. INTEGER_ARRAY arr
#

def insertionSort1(n, arr)
    # Write your code here 
    return if n == 0
    
    return arr[0] if n == 1
    
    curr = arr[n-1]
    i = n - 2
    stop = false
    while i >= 0 do
        if arr[i] >= curr
            arr[i+1] = arr[i]
        else
            arr[i+1] = curr
            i -= 1
            stop = true
        end 
        
        arr.each_with_index do |a, index|
            if index == arr.size - 1
                puts a
            else 
                print a.to_s + " "
            end
        end
        
        if i == 0
            arr[i]=curr
            arr.each_with_index do |a, index|
                if index == arr.size - 1
                    puts a
                else 
                    print a.to_s + " "
                end
            end
        end  
        break if stop
        i -= 1
    end    
end

n = gets.strip.to_i

arr = gets.rstrip.split.map(&:to_i)

insertionSort1 n, arr
