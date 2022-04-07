RSpec.describe EiaFuel do
  describe ".base_url" do
    after :each do
      EiaFuel.base_url = 'https://api.eia.gov'
    end

    it "should return 'https://api.eia.gov'" do
      expect(EiaFuel.base_url).to eq('https://api.eia.gov')
    end

    it "allows setting the base_url to a new value" do
      EiaFuel.base_url = 'http://example.com'
      expect(EiaFuel.base_url).to eq('http://example.com')
    end
  end

  describe ".api_key" do
    after :each do
      EiaFuel.api_key = nil
    end

    it "returns the api_key" do
      expect(EiaFuel.api_key).to be_nil
    end

    it "allows setting the api_key" do
      EiaFuel.api_key = 'sample'
      expect(EiaFuel.api_key).to eq('sample')
    end
  end
end
