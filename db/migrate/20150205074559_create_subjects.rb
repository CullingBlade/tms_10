class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.text :description
      t.references :user, index: true
      t.references :enrollment, index: true

      t.timestamps
    end
  end
end
