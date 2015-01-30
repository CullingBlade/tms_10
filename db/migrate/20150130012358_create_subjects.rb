class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.text :description
      t.integer :num_of_task
      t.references  :user, index: true
      t.datetime :start
      t.datetime :finish

      t.timestamps
    end
  end
end