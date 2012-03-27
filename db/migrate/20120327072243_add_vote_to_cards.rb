class AddVoteToCards < ActiveRecord::Migration
  def change
    add_column :cards, :total_upvotes, :integer
    add_column :cards, :total_downvotes, :integer
  end
end
