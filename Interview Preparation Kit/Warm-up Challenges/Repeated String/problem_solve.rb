#!/bin/ruby

require 'json'
require 'stringio'

# Complete the repeatedString function below.
def repeatedString(s, n)
    mod_subs = n % s.size
    total_a_in_mod = mod_subs == 0 ? 0 : (s[0..mod_subs-1].count "a")
    result = total_a_in_mod + ((n/s.length).floor * (s.count "a"))

    return result
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.to_s.rstrip

n = gets.to_i

result = repeatedString s, n

fptr.write result
fptr.write "\n"

fptr.close()