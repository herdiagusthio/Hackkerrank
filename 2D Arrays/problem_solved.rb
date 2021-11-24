#!/bin/ruby

require 'json'
require 'stringio'


def create_hourglass(arr_data)
  sum_hourglass = Array.new
  arr = arr_data
  arr.each_with_index do |x, i|
    if i < 4
      x.each_index do |j|
        if j < 4
          sum = (arr[i][j] + arr[i][j+1] + arr[i][j+2] + arr[i+1][j+1] + arr[i+2][j] + arr[i+2][j+1] + arr[i+2][j+2])
          sum_hourglass << sum
        end
      end
    end
  end
  sum_hourglass
end

arr = Array.new(6)

6.times do |i|
    arr[i] = gets.rstrip.split(' ').map(&:to_i)
end

print result = create_hourglass(arr).max