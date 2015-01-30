class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string		:name
      t.integer 	:num_of_course	
      t.text		:description
      t.references 	:user, index: true
      t.datetime	:start
      t.datetime	:finish

      t.timestamps
    end
  end
end
