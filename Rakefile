require 'mongo'
include Mongo

client = MongoClient.new

task :initdb do
	client.drop_database('magemelee')

	db = client.db('magemelee', :strict => true)
	db.create_collection('games')
end