require 'json'

module EiaFuel
  class Client
    def initialize(api_key = nil)
      EiaFuel.api_key = api_key unless api_key.nil?
      raise ::EiaFuel::ApiKeyError.new("Missing the api_key") if EiaFuel.api_key.nil?
    end

    def get(series_id)
      conn = Faraday.new(url: "#{EiaFuel.base_url}/seriesid/#{series_id}")
      res = conn.get do |f|
        f.params[:api_key]   = EiaFuel.api_key
      end
      parse_response(res)
      rescue => e
        puts "An error ocurred while fetching data: #{e}"
    end

    private

    def parse_response(response)
      res = JSON.parse(response.body)
      if res['response']
        EiaFuel::Series.new(res['response'])
      else
        JSON.parse(response.body)
      end
    end
  end
end
