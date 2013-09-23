require 'mongo'
include Mongo

require 'sinatra'
require 'slim'

load 'models/game.rb'

class MageMeleeApp < Sinatra::Base
	enable :sessions

	db = MongoClient.new.db('magemelee', :strict => true)
	
	if db['games'] then
		games = db['games']
	else
		games = db.create_collection('games')
	end

	get '/' do
		all_games = games.find().map do |doc|
			Game.deserialize(doc)
		end

		slim :landing, locals: { :games => all_games }
	end

	get '/login' do
		session[:logged_in] = "yup"
		"done"
	end

	get '/is_logged_in' do
		"logged_in: #{session[:logged_in]}"
	end

	post '/new_game' do
		game = Game.new do
			self.name = "butts #{rand(1000)}"
		end

		games.insert(game.serialize)
	end
end
