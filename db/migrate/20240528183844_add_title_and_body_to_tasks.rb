# frozen_string_literal: true

class AddTitleAndBodyToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :title, :string
    add_column :tasks, :body, :text
  end
end
