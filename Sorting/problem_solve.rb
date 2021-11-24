#!/bin/ruby

n = gets.strip.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)
# Write Your Code Here


totalOfSwaps = 0
for i in 0..n-1
    numberOfSwaps = 0

    for j in 0..n-2
        if a[j] > a[j+1]
            a[j], a[j+1] = a[j+1], a[j]
            numberOfSwaps +=1 && totalOfSwaps +=1
        end
    end

    break if numberOfSwaps == 0
end

puts "Array is sorted in #{totalOfSwaps} swaps."
puts "First Element: #{a.first}"
puts "Last Element: #{a.last}"