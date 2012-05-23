require 'Airport'

describe Airport do
  before do
    @a = Airport.new('A', 1, 2)
    @b = Airport.new('B', 7, 8)
  end

  describe '#latitude' do
    it 'returns upon initialization' do
      @a.lat.should eq(1)
    end

    it 'can be modified' do
      @a.lat = 5
      @a.lat.should eq(5)
    end
  end

  describe '#longitude' do
    it 'returns upon initialization' do
      @a.long.should eq(2)
    end

    it 'can be modified' do
      @a.long = 5
      @a.long.should eq(5)
    end
  end

  describe '#planes' do
    before do
      @b_plane = @a.create_plane(@b)
    end

    it 'can make an Airplane' do
      @a.planes.should include(@b_plane)
    end

    it 'should set that plane\'s destination correctly' do
      @b_plane.to.should eq(@b)
    end

    it 'should make an empty plane' do
      @b_plane.pop.should eq(0)
    end
  end
end
