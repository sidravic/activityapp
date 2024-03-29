worker_processes 2
working_directory "/Users/SIDDHARTH/rails_apps/idyllic/activityapp"

# Enabling this preloads an application before forking worker processes. This 
# allows memory savings when using a copy-on-write-friendly GC but can cause
# bad things to happen when resources like sockets are opened at load time by
# the master process and shared by multiple children. People enabling this are
# highly encouraged to look at the before_fork/after_fork hooks to properly 
# close/reopen sockets. Files opened for logging do not have to be reopened 
# as (unbuffered-in-userspace) files opened with the File::APPEND flag are
# written to atomically on UNIX.
# In addition to reloading the unicorn-specific config settings, SIGHUP will
# reload application code in the working directory/symlink when workers are 
# gracefully restarted when preload_app=false (the default). As reloading the
# application sometimes requires RubyGems updates, Gem.refresh is always called
# before the application is loaded (for RubyGems users).
preload_app true


# sets after_fork hook to a given block. This block will be called by the worker 
# after forking. The following is an example hook which adds a per-process listener
# to every worker
# after_fork do |server, worker|
# 	require 'amqp'

# 	ActiveRecord::Base.establish_connection if defined?(ActiveRecord::Base) 

# 	t = Thread.new{ 
# 		# AMQP.start(:host => 'localhost') do |connection|
# 		# 	AMQP.channel = AMQP::Channel.new(AMQP.connection)
# 		# 	queue = AMQP.channel.queue('rabbot.posts', :durable => true)
# 		# 	queue.subscribe do |body|
# 		# 		Activity.create!(:message => body)
# 		# 	end
# 		# end
# 		# 
# 		EventMachine.run
# 	}
# 	sleep(3)
# 	puts "AMQP started on activityapp...."
# 	t.join
# end
