class CreateMycredits < ActiveRecord::Migration
  def change
    create_table :mycredits do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
