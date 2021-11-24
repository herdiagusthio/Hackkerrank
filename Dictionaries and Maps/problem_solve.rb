# Enter your code here. Read input from STDIN. Print output to STDOUT
def create_hash(data, dictionary)
    data.each_with_index do |v, i|
        s = v.split(" ")
        dictionary[s[0]] = s[1]
    end
    dictionary
end

times= gets.to_i
i = 0
dictionary = Hash.new
if times > 0 && times <= (10 ** 5)
    data = Array.new
    while i < times
        data << gets
        i+=1
    end

    create_hash(data, dictionary)

    while q = gets
        q = q.strip
        dictionary.has_key?(q) ? text = "#{q}=#{dictionary[q]}" : text ="Not found"
        puts text
    end
end