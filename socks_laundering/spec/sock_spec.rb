require '/Users/elisafernandezvic/Desktop/CODING/ruby_katas/socks_laundering/SocksLaundering.rb' 

RSpec.describe SocksLaundering do

  it 'finds pairs of clean socks' do
    SockLaunder = SocksLaundering.new(5, [2, 5, 5, 2], [3])
    pairs = SockLaunder.findPairs()
    expect(pairs).to eq(2)
  end

  it 'deletes matched clean socks' do
    SockLaunder = SocksLaundering.new(5, [2, 5, 5, 2, 5], [3])
    SockLaunder.findPairs()
    clean = SockLaunder.clean
    expect(clean).to eq([5])
  end

  it 'pairs clean and dirty socks' do
    SockLaunder = SocksLaundering.new(5, [2, 5, 5, 2, 5, 3], [5, 3])
    pairs = SockLaunder.findPairs()
    expect(pairs).to eq(4)
  end

  it 'deletes matched dirty socks' do
    SockLaunder = SocksLaundering.new(5, [2, 5, 5, 2, 5, 1], [5, 1, 1])
    SockLaunder.findPairs()
    dirty = SockLaunder.dirty
    expect(dirty).to eq([1])
  end

  it 'reduces capacity with each sock it cleans' do
    SockLaunder = SocksLaundering.new(5, [2, 5, 5, 2, 5, 1], [5, 1])
    SockLaunder.findPairs()
    capacity = SockLaunder.capacity
    expect(capacity).to eq(3)
  end

  it 'stops matching clean-dirty socks when it has no capacity left' do
    SockLaunder = SocksLaundering.new(2, [2, 5, 5, 2, 5, 1, 0], [5, 1, 0])
    pairs = SockLaunder.findPairs()
    expect(pairs).to eq(4)
  end

  it 'finds pairs of dirty socks' do
    SockLaunder = SocksLaundering.new(10, [2, 5, 5, 2, 5, 1, 0], [5, 1, 0, 4, 4, 8, 8])
    pairs = SockLaunder.findPairs()
    expect(pairs).to eq(7)
  end

  it 'stops finding pairs of dirty socks when it has no capacity left' do
    SockLaunder = SocksLaundering.new(5, [2, 5, 5, 2, 5, 1, 0], [5, 1, 0, 4, 4, 8, 8])
    pairs = SockLaunder.findPairs()
    expect(pairs).to eq(6)
  end

  it 'test example' do
    SockLaunder = SocksLaundering.new(2, [1, 2, 1, 1], [1, 4, 3, 2, 4])
    pairs = SockLaunder.findPairs()
    expect(pairs).to eq(3)
  end
  
end

