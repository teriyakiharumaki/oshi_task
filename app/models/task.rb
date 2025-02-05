# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user
  has_many :subtasks, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
end
