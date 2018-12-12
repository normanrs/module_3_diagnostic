class NrelService

	def initialize(zip)
		@zip = zip
	end

  def get_stations
    get_json("/api/alt-fuel-stations/v1/nearest")
  end

  def get_json(url)
    conn = Faraday.new
    response = conn.get do |req|
      req.url "https://developer.nrel.gov#{url}"
      req.headers( ["fuel_type"] = "ELEC, LPG",
                    limit: 10,
                    location: @zip,
                    radius: 6,
                    api_key: ENV["nrel_key"],
                  }
    end
    require "pry"; binding.pry
		parsed = JSON.parse(response.body, symbolize_names: true)
	end

end
