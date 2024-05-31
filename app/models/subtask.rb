# frozen_string_literal: true

class Subtask < ApplicationRecord
  belongs_to :task
  has_many :third_tasks, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true
end
