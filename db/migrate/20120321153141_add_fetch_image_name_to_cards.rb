class AddFetchImageNameToCards < ActiveRecord::Migration
  def change
    add_column :cards, :fetch_image_name, :string
  end
end
