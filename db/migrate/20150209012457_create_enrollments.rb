class CreateEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|
      t.references :user, index: true
      t.references :course, index: true

      t.timestamps
    end
  end
end
