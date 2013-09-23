require 'sinatra'

class MageMeleeApp < Sinatra::Base
	enable :sessions

	get '/' do
		"hello world!"
	end

	get '/login' do
		session[:logged_in] = "yup"
		"done"
	end

	get '/is_logged_in' do
		"logged_in: #{session[:logged_in]}"
	end
end
