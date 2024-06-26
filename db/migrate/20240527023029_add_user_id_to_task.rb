# frozen_string_literal: true

class AddUserIdToTask < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :user_id, :integer
  end
end
