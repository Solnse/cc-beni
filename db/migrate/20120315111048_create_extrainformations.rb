class CreateExtrainformations < ActiveRecord::Migration
  def change
    create_table :extrainformations do |t|
      t.string :title
      t.string :short_desc
      t.string :long_desc
      t.integer :card_id

      t.timestamps
    end
  end
end
