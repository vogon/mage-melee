class Game
	def initialize(&block)
		instance_eval(&block)
	end

	def self.deserialize(hash) 
		return Game.new do
			self.name = hash["name"]
		end
	end

	def serialize
		{ "name" => self.name }
	end

	attr_accessor :name
end