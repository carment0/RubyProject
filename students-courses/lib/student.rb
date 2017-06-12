# ## Student
# * `Student#initialize` should take a first and last name.
# * `Student#name` should return the concatenation of the student's
#   first and last name.
# * `Student#courses` should return a list of the `Course`s in which
#   the student is enrolled.
# * `Student#enroll` should take a `Course` object, add it to the
#   student's list of courses, and update the `Course`'s list of
#   enrolled students.
#     * `enroll` should ignore attempts to re-enroll a student.
# * `Student#course_load` should return a hash of departments to # of
#   credits the student is taking in that department.
# * Update `Student#enroll` so that you raise an error if a `Student`
#   enrolls in a new course that conflicts with an existing course time.
#     * May want to write a `Student#has_conflict?` method to help.

class Student
  attr_accessor :first_name, :last_name, :courses

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def enroll(new_course)
    @courses.each do |course|
      if course.conflicts_with?(new_course)
        raise "Course conflicts with already enrolled course"
      end
    end
    unless @courses.include?(new_course)
      @courses << new_course
      new_course.students << self
    end
  end



  def course_load
    course_load = Hash.new
    @courses.each do |course|
      if course_load[course.department].nil?
        course_load[course.department] = course.credits
      else
        course_load[course.department] += course.credits
      end
    end
    course_load
  end
end
