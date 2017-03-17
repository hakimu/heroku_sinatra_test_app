require 'json'
require 'new_relic/agent'
#require 'tasks/newrelic'
#NewRelic::Agent.manual_start(:sync_startup => true)

task :custom do
	class Cart
		def checkout
			number = rand(100)
			::NewRelic::Agent.record_metric('Custom/testing/checkout',number)
		end
	end
	Cart.new.checkout
end

task :demo do
	def adder(x,y)
		puts x + y
	end
	adder(50,5)
end



