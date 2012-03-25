class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  tango_user
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  after_create :create_profile
  has_one :profile

   # returns/calculates list of symbols, where each symbol is a name of a role the user currently has
  def roles_list
    if self.email == "admin@gmail.com"	
    [:admin, :member]
    else
	[:member]
    end   
  end

  # optional
  def has_role? role
    roles_list.include? role.to_sym
  end

  def create_profile
    Profile.create(:user_id=>self.id)
   end
  

end
