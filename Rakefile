require 'json'
require 'new_relic/agent'
NewRelic::Agent.manual_start(:sync_startup => true)

task :custom do
	class Cart
		def checkout
			number = rand(100)
			::NewRelic::Agent.record_metric('Custom/testing/checkout',number)
		end
	end
	Cart.new.checkout
end



