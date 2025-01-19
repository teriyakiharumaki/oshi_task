class CreateAiComments < ActiveRecord::Migration[7.1]
  def change
    create_table :ai_comments do |t|
      t.text :task_created_comment
      t.text :task_updated_comment
      t.text :task_deleted_comment
      t.text :task_completed_comment
      t.text :sub_task_completed_comment
      t.text :task_incomplete_comment
      t.references :oshi_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
