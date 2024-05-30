class CreateSubtasks < ActiveRecord::Migration[7.1]
  def change
    create_table :subtasks do |t|
      t.string :title, null: false
      t.text :body
      t.boolean :done, default: false
      t.integer :task_id, null: false

      t.timestamps
    end
  end
end
