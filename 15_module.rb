module Login
  def login username, password
    @username == username and
      @password == password and
      p "Successfully logged in as #{@username}"
  end

  def logout
  end

  def sign_up
  end
end

class Student
  include Login
  def initialize name, born_at, gender, username, password
    @name, @born_at, @gender = name, born_at, gender
    @username = username
    @password = password
  end
  def age
    age Date.today.year - @born_at.year
    age -= 1 if Date.today < birthday + age.years
  end
end

class Teacher
  include Login
  def initialize name, proficiency, list_of_grades, username, password
    @name = name
    @proficiency = proficiency
    @list_of_grades = list_of_grades
    @username = username
    @password = password
  end
end

student = Student.new 'John', Time.new("1990-01-01"), 'M', 'user1', 'pwd1'
teacher = Teacher.new 'Jane', Time.new("1990-01-01"), 'F', 'user2', 'pwd2'

student.login 'wrongUserName', 'pwd1'
teacher.login 'user2', 'pwd2'
