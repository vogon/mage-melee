require 'mongo'
include Mongo

client = MongoClient.new

task :default do
	sh 'rackup'
end

task :initdb do
	client.drop_database('magemelee')
end
