if ENV['RAILS_ENV']
  # Called after the irb session is initialized and Rails has been loaded
  IRB.conf[:IRB_RC] = Proc.new do
    begin
      Authorization.current_user = User.first
    rescue Exception => e
    end
    logger = Logger.new(STDOUT)
    ActiveRecord::Base.logger = logger
    ActiveResource::Base.logger = logger
  end
end
