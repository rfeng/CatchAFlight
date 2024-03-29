require 'CatchAFlight'

describe CatchAFlight do

  describe '#create_map' do

    before do
      @airports = [['First', 1, 2], ['Second', 3, 4],['Third', 5, 6]]
    end

    it 'should map @airports to the same number of Airports' do
      map = create_map(@airports)
      map.length.should eq(@airports.length)
    end

    it 'should map airport names to Airports' do
      @airports.length.times do |i|
        map[i].name.should eq(@airports[i][0])
      end
    end

    it 'should map airport latitudes to Airports' do
      @airports.length.times do |i|
        map[i].latitude.should eq(@airports[i][1])
      end
    end

    it 'should map airport latitudes to Airports' do
      @airports.length.times do |i|
        map[i].longitiude.should eq(@airports[i][2])
      end
    end
  end
end
