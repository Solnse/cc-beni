class FixCardsFieldNameType < ActiveRecord::Migration
 def change
    rename_column :cards, :type, :card_type
  end
end
