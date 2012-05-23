require 'Airport'

describe Airport do
  before do
    @a = Airport.new('A', 1, 2)
    @b = Airport.new('B', 7, 8)
  end

  describe '#latitude' do
    it 'returns upon initialization' do
      a.lat.should eq(1)
    end

    it 'can be modified' do
      a.lat = 5
      a.lat.should eq(5)
    end
  end

  describe '#longitude' do
    it 'returns upon initialization' do
      a = Airport.new(1,2)
      a.long.should eq(2)
    end

    it 'can be modified' do
      a.long = 5
      a.long.should eq(5)
    end
  end

  describe '#planes' do
    it 'can make an Airplane' do
      b_plane = a.create_plane(@b)
      a.planes.should include(b_plane)
    end

    it 'should set that plane\'s destination correctly' do
      b_plane = a.create_plane(@b)
      b_plane.to.should eq(@b)
    end

    
  end
end
