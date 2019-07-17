class Helper

  def self.is_teacher?(hash)
    !!(Teacher.find(hash[:teacher_id])
  end

  def self.is_student?(hash)
    !!Student.find(hash[:student_id])
  end

  def self.current_teacher(hash)
    Teacher.find(hash(:teacher_id))
  end

  def self.current_student(hash)
    Student.find(hash(:student_id))
  end
