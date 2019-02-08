class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.text :act_type
      t.references :user, index: true
      t.references :cource, index: true
      t.references :subject, index: true
      t.references :task, index: true

      t.timestamps
    end
  end
end
