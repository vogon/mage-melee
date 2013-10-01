require 'mongo_mapper'

class Mage
	include MongoMapper::Document

	key :life, Integer
	key :vp, Integer
	
	key :stun, Integer

	belongs_to :game
end