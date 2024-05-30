class Subtask < ApplicationRecord
  belongs_to :task

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true
end
