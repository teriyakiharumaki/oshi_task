class AddOshiAvatarToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :oshi_avatar, :string
  end
end
