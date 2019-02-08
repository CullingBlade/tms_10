class CreateCoursesSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :courses_subjects do |t|
      t.references :course, index: true
      t.references :subject, index: true

      t.timestamps
    end
  end
end
