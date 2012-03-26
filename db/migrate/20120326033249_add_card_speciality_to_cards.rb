class AddCardSpecialityToCards < ActiveRecord::Migration
  def change
    add_column :cards, :speciality, :string
  end
end
