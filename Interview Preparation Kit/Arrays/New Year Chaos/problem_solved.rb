#!/bin/ruby

require 'json'
require 'stringio'

# Complete the minimumBribes function below.
def minimumBribes(q)
    i= q.size
    bribes = 0
    until i==0
        if q[i-1] != i
            if ((i-2) >= 0) && (q[i-2] == i)
                q[i-2], q[i-1] = q[i-1], q[i-2]
                bribes+=1
            elsif ((i-3) >= 0) && (q[i-3] == i)
                q[i-3], q[i-2], q[i-1] = q[i-2], q[i-1], q[i-3]
                bribes+=2
            else
                str = "Too chaotic"
                break
            end
        end
        i-=1
        str = bribes.to_s
    end    
    puts str
end

t = gets.to_i

t.times do |t_itr|
    n = gets.to_i

    q = gets.rstrip.split(' ').map(&:to_i)

    minimumBribes q
end