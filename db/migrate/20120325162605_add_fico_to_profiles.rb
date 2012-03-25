class AddFicoToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :fico, :integer
    add_column :profiles, :address, :string
    add_column :profiles, :city, :string
    add_column :profiles, :country, :string
    add_column :profiles, :purpose, :text
    add_column :profiles, :expert, :text

  end
end
