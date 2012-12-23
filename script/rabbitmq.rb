require 'rubygems'
require 'amqp'
require File.dirname(__FILE__) + "/../config/environment.rb"

ENV['RAILS_ENV'] ||= "development"

AMQP.start(:host => 'localhost') do |connection|
	puts "AMQP connection established....."
	channel = AMQP::Channel.new(connection)
	exchange = channel.fanout('rabbots.exchange')
	puts "AMQP channel obtained....."
	#queue = AMQP::Queue.new(channel, 'rabbot.posts', :durable => true)
	channel.queue("rabbot.posts", :durable => true) do |queue|
		puts "QUEUE obtained #{queue.name}"
		queue.bind(exchange).subscribe do |metadata, payload|
			puts  ">> Payload #{payload}"
			puts ">> MetaData #{metadata}"
		end
	end
	
	
end