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

get '/show' do
	sleep 3
	"Testing stuff"
end

get '/custom' do
	@number = rand(100)
	::NewRelic::Agent.record_metric('Custom/testing/alert',@number)
	erb :custom
end

get '/foo' do
	headers['Content-Type'] = '***/***'
	print headers
end