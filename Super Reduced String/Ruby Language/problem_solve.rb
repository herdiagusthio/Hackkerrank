#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'superReducedString' function below.
#
# The function is expected to return a STRING.
# The function accepts STRING s as parameter.
#

def superReducedString(s)
    # Write your code here
    i = 0
    loop = true
    while loop do
        if s.length != 0
            if s[i] == s[i+1]
                s[i..i+1] = ""
                i = 0
            else
                i < s.length - 1 ? i += 1 : loop = false
            end 
        else
            loop = false
            s = "Empty String"
        end 
    end
    
    return s
end 

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.chomp

result = superReducedString s

fptr.write result
fptr.write "\n"

fptr.close()
