class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :content
      t.integer :card_id

      t.timestamps
    end
  end
end
