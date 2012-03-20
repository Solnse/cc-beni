class CreateCardsProfiles < ActiveRecord::Migration
  def change
    create_table :cards_profiles do |t|
      t.integer :profile_id
      t.integer :card_id

      t.timestamps
    end
  end
end
