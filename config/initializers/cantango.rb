CanTango.config do |config|
 
  # more configuration here...

 config.debug.set :on
  config.permits.disable :account, :special, :role_group
  config.engines.all :on

  # config.engine(:permission).set :off
  # config.engine(:cache).set :off

end
