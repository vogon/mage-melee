require 'json'

require 'mongo'
include Mongo

require 'sinatra'
require 'slim'

load 'models/game.rb'

class MageMeleeApp < Sinatra::Base
	enable :sessions

	db = MongoClient.new.db('magemelee', :strict => true)
	
	if db.collection_names.index('games') then
		games = db['games']
	else
		games = db.create_collection('games')
	end

	get '/' do
		slim :landing
	end

	get '/ajax/games' do
		all_games = games.find().map do |doc|
			Game.deserialize(doc)
		end

		{ games: all_games }.to_json
	end

	get '/ajax/login' do
		session[:logged_in] = "yup"
		"done"
	end

	get '/ajax/is_logged_in' do
		"logged_in: #{session[:logged_in]}"
	end

	post '/ajax/new_game' do
		game = Game.new do
			self.name = "butts #{rand(1000)}"
		end

		games.insert(game.serialize)
	end
end
