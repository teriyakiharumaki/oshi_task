class OshiProfile < ApplicationRecord
  belongs_to :user

  has_one :ai_comment, dependent: :destroy

  validates :name, :personality, :generation, :gender, :pronoun, presence: true

  mount_uploader :avatar, AvatarUploader
end
