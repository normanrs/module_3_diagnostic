class SearchFacade

	def initialize(zip)
		@zip = zip
	end

  def stations
		station_results[0..9].map do |station_data|
		  Station.new(station_data)
    end
	end

  def station_results
    @_station_results ||= service.get_stations
  end

  def service
    NrelService.new(@zip)
  end

end
