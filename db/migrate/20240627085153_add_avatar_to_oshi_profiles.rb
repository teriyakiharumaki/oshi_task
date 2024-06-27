class AddAvatarToOshiProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :oshi_profiles, :avatar, :string
  end
end
