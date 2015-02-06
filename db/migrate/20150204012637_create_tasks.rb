class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :start
      t.datetime :finish
      t.integer :subject_id
      t.references :user, index: true

      t.timestamps
    end
  end
end
