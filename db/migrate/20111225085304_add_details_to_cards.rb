class AddDetailsToCards < ActiveRecord::Migration
  def change
    add_column :cards, :apr, :string
    add_column :cards, :reward_type, :string
    add_column :cards, :special_promotion, :boolean
    add_column :cards, :promotion_requirements, :string
    add_column :cards, :promotion_offer, :string
    add_column :cards, :activation_date, :date
  end
end
