class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :subject, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
