# frozen_string_literal: true

class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: { message: :wrong_password_confirmation }, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true, length: { maximum: 255 }

  has_many :tasks

  has_one :oshi_profile, dependent: :destroy
  accepts_nested_attributes_for :oshi_profile

  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications

end
