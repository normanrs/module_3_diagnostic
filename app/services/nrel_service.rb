class NrelService

	def initialize(zip)
		@zip = zip
	end

  def get_stations
    conn = Faraday.new
    response = conn.get do |req|
      req.url "# https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?fuel_type=ELEC, LPG&limit=10&api_key=#{ENV["nrel_key"]}&location=#{@zip}&radius=6"
    end
		parsed = JSON.parse(response.body, symbolize_names: true)
	end

end
