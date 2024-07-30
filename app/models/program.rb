class Program < ApplicationRecord
    has_many :student_programs
    has_many :students, through: :student_programs
end
