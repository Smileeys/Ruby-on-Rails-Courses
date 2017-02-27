ENV['FOOD2FORK_KEY'] = "77fafdd9293cceda8f9b3391312a3b2a" #TODO CHANGE PLACE
ENV['FOOD2FORK_SERVER_AND_PORT'] = "food2fork.com"
class Recipe
	include HTTParty

	key_value = ENV['FOOD2FORK_KEY']
	hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
	base_uri "http://#{hostport}/api"
	default_params key: ENV['FOOD2FORK_KEY']
	format :json

	def self.for (keyword)
		get("/search", query: {q: keyword})["recipes"]
	end
end
