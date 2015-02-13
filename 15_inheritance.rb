class Student < User
  def initialize name, born_at, gender
    @name, @born_at, @gender = name, born_at, gender
  end
  def age
    age Date.today.year - @born_at.year
    age -= 1 if Date.today < birthday + age.years
  end
end

class Teacher < User
  def initialize name, proficiency, list_of_grades
    @name = name
    @proficiency = proficiency
    @list_of_grades = list_of_grades
  end
end

class User
  def initialize username, password
    @username = username
    @password = password
  end

  def login
  end
  
  def logout
  end

  def sign_up
  end
end
