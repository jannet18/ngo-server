class CreateStudentPrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :student_programs do |t|
      t.references :student, null: false, foreign_key: true
      t.references :program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
