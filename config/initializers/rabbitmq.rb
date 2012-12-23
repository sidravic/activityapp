# after_fork do |server, worker|
# 	require 'amqp'

# 	ActiveRecord::Base.establish_connection if defined?(ActiveRecord::Base) 

# 	t = Thread.new{ 
# 		AMQP.start(:host => 'localhost') 
# 	}
# 	sleep(3)

# 	puts "AMQP started on activityapp...."

# 	puts AMQP.inspect		

# 	channel = AMQP::Channel.new(AMQP.connection)			
# 	queue = channel.queue('rabbot.posts', :durable => true)
# 	queue.subscribe do |body|
# 		puts "Message >> #{body}"
# 	end

	
# end

# AMQP.start(:host => 'localhost') do |connection, open_ok|
# 	puts ">>> AMQP Started >>> "
# 	channel  = AMQP::Channel.new(connection)
# 	channel.queue("rabbot.posts", :durable => true).subscribe do |payload, meta_data|
# 		Activity.create!(:message => body)
# 	end
# end

