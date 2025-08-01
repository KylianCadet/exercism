class School
  class Student
    attr_accessor :name, :grade

    def initialize(name, grade)
      @name = name
      @grade = grade
    end
  end

  def initialize
    @students = []
  end

  def add(name, grade)
    new_student = !(roster.include? name)
    @students << Student.new(name, grade) if new_student
    new_student
  end

  def roster
    sorted_student.map(&:name)
  end

  def grade(grade)
    sorted_student.select{|student| student.grade == grade}.map(&:name)
  end

  private
  def sorted_student
    @students.sort_by{|student| [student.grade, student.name]}
  end
end