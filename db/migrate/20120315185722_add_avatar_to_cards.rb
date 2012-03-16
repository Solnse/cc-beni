class AddAvatarToCards < ActiveRecord::Migration
  

def self.up
    change_table :cards do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down
    drop_attached_file :cards, :avatar
  end


end
