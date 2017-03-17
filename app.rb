require 'json'
require 'puma'
require 'sinatra'
require 'logger'
require 'sidekiq'
require 'newrelic_rpm'


get '/bye' do
	my_hash = {"day" => "saturday"}
	my_json = JSON.generate(my_hash)
	my_json
end

get '/grab' do
	uri = URI('http://localhost:4567/end')
	Net::HTTP.get(uri)
end

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

get '/deploy' do
	"testing deployment!!!"
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
	headers['Content-Type'] = 'text/plain'
	print headers
end


get '/gc' do
	begin
		logger = Logger.new('logfile.log')
		#file = File.open('foo.log', File::WRONGLY | File::APPEND)
		#logger = Logger.new(file)
		pid = Process.pid
		logger.info "I just added the PID #{pid}"
		["Theres no error"]
	rescue
		pid = Process.pid
	  ["The PID is #{pid}", " The and again is #{pid}"]
	end
end

class BackgroundTask
	include Sidekiq::Worker

	def perform
		sleep 5
		puts 'Goodnight'
	end
end

BackgroundTask.perform_async