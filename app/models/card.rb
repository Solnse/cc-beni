class Card < ActiveRecord::Base
  attr_accessible :card_name, :card_type
  
  validates_presence_of :card_name, :card_type, :message => " should not be empty! "
  validates_uniqueness_of :card_name
  validates_inclusion_of :card_type, :in => %w(Visa MasterCard Amex Discover),
    :message => " only allows Visa, MasterCard, Amex, or Discover"
end
