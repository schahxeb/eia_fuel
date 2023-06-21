require 'spec_helper'

RSpec.describe "Fetching list of diesel series" do
  describe "given list of valid series ids" do
    before(:example) do
      @client = EiaFuel::Client.new(API_KEY)
    end
    it "returns the latest price for each one" do
      num = rand(7)
      arr = %W(
        PET.EMD_EPD2D_PTE_NUS_DPG.W
        PET.EMD_EPD2D_PTE_SCA_DPG.W
        PET.EMD_EPD2D_PTE_R1Y_DPG.W
        PET.EMD_EPD2D_PTE_R10_DPG.W
        PET.EMD_EPD2D_PTE_R40_DPG.W
        PET.EMD_EPD2D_PTE_R5XCA_DPG.W
        PET.EMD_EPD2D_PTE_R50_DPG.W
      ).sample(num).map do |series_id|
        d = @client.get(series_id)
        [d.description, d.latest_price]
      end

      expect(arr.length).to eq(num)
    end
  end
end
