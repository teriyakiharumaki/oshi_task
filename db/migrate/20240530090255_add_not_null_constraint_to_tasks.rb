# frozen_string_literal: true

class AddNotNullConstraintToTasks < ActiveRecord::Migration[7.1]
  def change
    change_column_null :tasks, :user_id, false
    change_column_null :tasks, :title, false
  end
end
