class AddStatusToEnrollment < ActiveRecord::Migration[5.0]
  def change
    add_column :enrollments, :status, :integer, :limit => 4
  end
end
