class CreateEnrollmentSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollment_subjects do |t|
      t.references :user, index: true
      t.references :subject, index: true
      t.references :course, index: true
      t.references :courses_subject, index: true
      t.references :enrollment, index: true
      
      t.integer :status
      t.timestamps
    end
  end
end
