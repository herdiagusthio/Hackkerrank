#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'isBalanced' function below.
#
# The function is expected to return a STRING.
# The function accepts STRING s as parameter.
#

def isBalanced(s)
    # Write your code here
    n = -1
    while s.size != n do
        n = s.size 
        s = s.gsub("[]", "")
        s = s.gsub("()", "")
        s = s.gsub("{}", "")
    end
    
    return s.size == 0 ? "YES" : "NO"
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

t = gets.strip.to_i

t.times do |t_itr|
    s = gets.chomp

    result = isBalanced s

    fptr.write result
    fptr.write "\n"
end

fptr.close()
