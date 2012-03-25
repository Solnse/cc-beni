# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'Chad', :email => 'cedie@hotmail.com', :password => 'Lovely', :password_confirmation => 'Lovely'
puts 'New user created: ' << user.name
adminuser = User.create! :name => 'Admin', :email => 'admin@gmail.com', :password => 'admin123', :password_confirmation => 'admin123'
adminuser.confirmed_at=Time.now
adminuser.confirmation_token=nil
adminuser.save


