class Profile < ActiveRecord::Base
belongs_to :user
has_and_belongs_to_many :cards
scope :request_advice,where("purpose != ? or purpose != ? ",nil,'')

end
