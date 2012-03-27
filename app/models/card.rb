class Card < ActiveRecord::Base

  acts_as_taggable     
    self.per_page = 10
  attr_accessible :card_name, :card_type,:description,:example,:cash_back,:credit_builder,:expertopinion,:moreinfo,:avatar
  
  validates_presence_of :card_name, :card_type, :message => " should not be empty! "
 # validates_uniqueness_of :card_name
  validates_inclusion_of :card_type, :in => %w(Visa MasterCard Amex Discover),
    :message => " only allows Visa, MasterCard, Amex, or Discover"
has_many :features, dependent: :destroy
has_many :carddetails, dependent: :destroy

has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

has_and_belongs_to_many :profiles

end
