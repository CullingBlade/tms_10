class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.datetime :start
      t.datetime :finish

      t.timestamps
    end
  end
end
