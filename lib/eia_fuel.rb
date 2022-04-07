# frozen_string_literal: true
require 'faraday'

# Version
require_relative "./eia_fuel/version"

# lib
require_relative './eia_fuel/client'
require_relative './eia_fuel/series'

module EiaFuel
  @base_url = 'https://api.eia.gov'
  @api_key = nil

  class << self
    attr_accessor :api_key, :base_url
  end

  class ApiKeyError < StandardError; end
end
