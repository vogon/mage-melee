require 'sinatra'

class MageMeleeApp < Sinatra::Base
	get '/' do
		"hello world!"
	end
end
