#!/bin/ruby

require 'json'
require 'stringio'

# Complete the matchingStrings function below.
def matchingStrings(strings, queries)
    result = Array.new(queries.size, 0)

    queries.each_with_index do |q, i|
        result[i] = strings.count(q)
    end
    return result
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

strings_count = gets.to_i

strings = Array.new(strings_count)

strings_count.times do |i|
    strings_item = gets.to_s.rstrip
    strings[i] = strings_item
end

queries_count = gets.to_i

queries = Array.new(queries_count)

queries_count.times do |i|
    queries_item = gets.to_s.rstrip
    queries[i] = queries_item
end

res = matchingStrings strings, queries

fptr.write res.join "\n"
fptr.write "\n"

fptr.close()
