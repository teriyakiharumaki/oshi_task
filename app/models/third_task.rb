# frozen_string_literal: true

class ThirdTask < ApplicationRecord
  belongs_to :subtask

  validates :title, presence: true, length: { maximum: 255 }
end
