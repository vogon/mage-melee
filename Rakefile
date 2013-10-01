require 'mongo'
include Mongo

client = MongoClient.new

task :default do
	rackup
end

task :initdb do
	client.drop_database('magemelee')

	db = client.db('magemelee', :strict => true)
	db.create_collection('games')
end