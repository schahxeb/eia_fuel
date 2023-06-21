require 'date'

module EiaFuel
  class Series
    attr_reader :id
    attr_reader :frequency
    attr_reader :description
    attr_reader :data

    def initialize(series = nil)
      if series
        [:id, :frequency, :description].each do |var|
          self.instance_variable_set "@#{var}", series[var.to_s]
        end
        @data = generate_data(series["data"])
      end
    end

    def latest_price
      data.first.price
    end

    private

    def generate_data(data_array)
      data_array.map do |dict|
        Tuple.new(Date.strptime(dict["period"], "%Y-%m-%d"), dict["value"])
      end
    end
  end
  Tuple = Struct.new(:date, :price)
end
