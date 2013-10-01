require 'models/game'
require 'models/mage'

module GameSession
	class << self 
		def new_game(name)
			Game.create(
				name: name
			)
		end
	end
end