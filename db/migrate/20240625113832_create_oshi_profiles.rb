class CreateOshiProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :oshi_profiles do |t|
      t.string :name
      t.string :personality
      t.string :generation
      t.string :gender
      t.string :pronoun
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
