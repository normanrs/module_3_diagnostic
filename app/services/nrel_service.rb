class NrelService

	def initialize(zip)
		@zip = zip
	end

  def get_stations
    get_json("/user/repos")
  end

  def get_json(url)
		response = conn.get(url)
		parsed = JSON.parse(response.body, symbolize_names: true)
	end

  def conn
		Faraday.new(url: "https://api.github.com") do |faraday|
			faraday.headers["Authorization"] = "token #{@user.github_key}"

			faraday.adapter Faraday.default_adapter
		end
	end

end
