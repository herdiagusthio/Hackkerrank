# Enter your code here. Read input from STDIN. Print output to STDOUT
t = gets.to_i

if t > 0 && t <= 10
    list = Array.new
    final_list = Array.new
    i = 0
    while i < t
        s = gets
        list << s.strip
        i+=1
    end
    
    list.each do |l|
      if l.length > 1 && l.length <= 10000
        j = 0
        s1 = ""
        s2 = ""
        while j < l.length
            j.even? ? s1 << l[j] : s2 << l[j]
            j+=1
        end
        puts "#{s1} #{s2}"
      end
    end
end