class Game
	include MongoMapper::Document

	key :name, String

	many :mages
end