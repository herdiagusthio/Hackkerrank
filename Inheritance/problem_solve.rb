class Person
	def initialize(firstName, lastName, id)
		@firstName = firstName
		@lastName = lastName
		@id = id
	end
	def printPerson()
		print("Name: ",@lastName , ", " + @firstName ,"\nID: " , @id)
	end
end

class Student <Person
    #   Class Constructor
    #   
    #   Parameters:
    #   firstName - A string denoting the Person's first name.
    #   lastName - A string denoting the Person's last name.
    #   id - An integer denoting the Person's ID number.
    #   scores - An array of integers denoting the Person's test scores.
    #
    # Write your constructor here
    def initialize(firstName, lastName, id, scores)
      super(firstName, lastName, id)
      @scores = scores
    end
    

    #   Function Name: calculate
    #   Return: A character denoting the grade.
    #
    # Write your function here
    def calculate
      sum_score = @scores.inject(0){|sum,x| sum + x }
      avg_score = sum_score.to_f / @scores.length.to_f
      
      if avg_score >= 90 
        grade = "O"
      elsif avg_score >= 80 && avg_score < 90
        grade = "E"
      elsif avg_score >= 70 && avg_score < 80
        grade = "A"
      elsif avg_score >= 55 && avg_score < 70
        grade = "P"
      elsif avg_score >= 40 && avg_score < 55
        grade = "D"
      else
        grade = "T"
      end
    end
    
end

input = gets.split()
firstName = input[0]
lastName = input[1]
id = input[2].to_i
numScores = gets.to_i
scores = gets.strip().split().map!(&:to_i)
s = Student.new(firstName, lastName, id, scores)
s.printPerson           
print("\nGrade: " + s.calculate)