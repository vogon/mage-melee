require 'models/game'
require 'models/mage'

module GameSession
	class << self 
		def new_game(props)
			Game.create(
				name: props[:name]
			)
		end
	end
end