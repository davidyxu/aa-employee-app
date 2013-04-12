#DF20BFFFFE13EB9A9B3A258D1EE1E15F

require 'net/http'  
require 'net/https'  
require 'uri'
require 'json'

class DotaRuby
	def initialize(key)
		@key = key
		@http = Net::HTTP.new("api.steampowered.com", 443)
		@http.use_ssl = true
		@http.verify_mode = OpenSSL::SSL::VERIFY_PEER
	end
	def get_matches
		result = @http.request(Net::HTTP::Get.new("/IDOTA2Match_570/GetMatchHistory/V001/?key=#{@key}"))
		puts result.body
	end
	def get_details(match_id)
		response = @http.request(Net::HTTP::Get.new("https://api.steampowered.com/IDOTA2Match_570/GetMatchDetails/V001/?match_id=#{match_id}&key=#{@key}"))
		data = response.body
		puts data
		result = JSON.parse(data)
		values = result["result"]
		#puts values["players"]
		puts values["duration"]
	end
end

class Match
	attr_reader :match_id, :match_details, :players
	def initialize(values)
		@match_id = values["match_id"]
		@winner = winner["radiant_win"]
	end
	def winner
		if @winner == "true"
			:radiant
		else
			:dire
		end
	end
	def players

	end
end

class Player
	attr_reader :player_id
	def initialize(player)
		@player_id = player_id
		@hero = player
	end
end

test = DotaRuby.new("DF20BFFFFE13EB9A9B3A258D1EE1E15F")
#test.get_matches
test.get_details("140296960")