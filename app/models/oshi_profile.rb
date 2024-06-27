class OshiProfile < ApplicationRecord
  belongs_to :user

  validates :name, :personality, :generation, :gender, :pronoun, presence: true

  mount_uploader :avatar, AvatarUploader
end
