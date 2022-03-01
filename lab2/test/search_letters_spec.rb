require 'rspec'
require_relative '../search_letters'

describe '#search_letters' do
  it 'should be ok for a word ending with CS' do
    expect(search_letters('HelloCS')).to eq(128)
  end

  it 'should be ok for a word ending in CS in lowercase' do
    expect(search_letters('Hellocs')).to eq('scolleH')
  end

  it 'should be ok for words not ending in CS' do
    expect(search_letters('HeCSllo')).to eq('ollSCeH')
  end

  it 'should be ok for words not ending in CS' do
    expect(search_letters('CSHello')).to eq('olleHSC')
  end
end
