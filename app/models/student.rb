class Student < ApplicationRecord
    enum gender: {male: 0, female: 0, other:2 }
    has_many :student_programs
    has_many :programs, through: :student_programs

    validates :fullname, presence: true
    validates :gender, presence: true
    validates :date, presence: true
    validates :contact, presence: true
    validates :church, presence: true
    validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP}
    validates :contact, presence: true, format: {with: /\A\d{10}\z/}
    validates :responsibility, presence: true
    validates :description, presence: true
    validates :motivation, presence: true
    validates :challenges, presence: true
    validates :availability, presence: true
    validates :commitments, presence:true
    validates :achievements, presence:true

end
