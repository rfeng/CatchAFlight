require 'Airplane'

describe Airplane do
  before do
    @a = 5
  end

  it 'should print 5 for @a' do
    @a.should eq(5)
  end

  describe '#sublevel1' do
    before do
      @b = 6
    end

    it 'should print 6 for @b' do
      @b.should eq(6)
    end
  end

  describe '#sublevel2' do
    before do
      @b = @a + 1
    end

    it 'should print 6 for @b' do
      @b.should eq(6)
    end
  end
end
