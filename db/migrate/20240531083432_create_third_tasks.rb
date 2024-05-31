class CreateThirdTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :third_tasks do |t|
      t.string :title, null: false
      t.text :body
      t.boolean :done, default: false
      t.integer :subtask_id, null: false

      t.timestamps
    end
  end
end
