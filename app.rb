require 'json'
require 'unicorn'
require 'sinatra'
require 'newrelic_rpm'

get '/' do
	@word = 'foo'.reverse
	@time = Time.now
	erb :home
end

error 409 do
	"Conflict"
end

get '/test' do
	409
end

get '/string' do
	Foo
end

get '/custom' do
	@number = rand(100)
	::NewRelic::Agent.record_metric('Custom/testing/alert',@number)
	erb :custom
end
