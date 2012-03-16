class AddDescriptionToCards < ActiveRecord::Migration
  def change
    add_column :cards, :description, :string
    add_column :cards, :example, :string
    add_column :cards, :cash_back, :string
    add_column :cards, :credit_builder, :string
    add_column :cards, :expertopinion, :string
    add_column :cards, :moreinfo, :text


  end
end
