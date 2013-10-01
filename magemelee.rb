# let us require files inside this tree with relative paths
$LOAD_PATH << File.expand_path(".")

require 'json'

require 'mongo'
require 'mongo_mapper'
include Mongo

require 'sinatra'
require 'slim'

require 'controller/gamesession'

require 'models/game'

class MageMeleeApp < Sinatra::Base
	enable :sessions

	MongoMapper.database = 'magemelee'

	get '/' do
		slim :landing
	end

	get '/ajax/games' do
		cache_control :no_cache

		{ games: Game.all }.to_json
	end

	post '/ajax/login' do
		session[:logged_in] = "yup"
		"done"
	end

	get '/ajax/is_logged_in' do
		"logged_in: #{session[:logged_in]}"
	end

	post '/ajax/new_game' do
		query = Rack::Utils.parse_query(request.query_string)
		400 if !query["name"]

		GameSession.new_game(
			name: query["name"]
		)
	end
end
