require 'json'
require 'unicorn'
require 'sinatra'
require 'newrelic_rpm'

get '/' do
	"Hello!!!"
end