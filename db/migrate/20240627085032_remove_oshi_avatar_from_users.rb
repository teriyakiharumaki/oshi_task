class RemoveOshiAvatarFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :oshi_avatar, :string
  end
end
