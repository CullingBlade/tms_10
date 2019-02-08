class CreateEnrollmentTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollment_tasks do |t|
      t.references :user, index: true
      t.references :task, index: true
      t.references :subject, index: true
      t.references :enrollment_subject, index: true
      t.integer :status

      t.timestamps
    end
  end
end
