require 'json'
require 'unicorn'
require 'sinatra'
require 'newrelic_rpm'

get '/' do
	"Hello!!!"
end

error 409 do
	"Conflict"
end

get '/test' do
	409
end