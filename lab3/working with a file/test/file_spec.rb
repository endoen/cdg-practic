require 'rspec'
require_relative '../file'

describe 'file' do
  before { File.write(FILE, "Белова Мия\nГолубева Анна\nАртамонов Никита\nАлексеева Эмилия\n", mode: 'w') }

  it '#index' do
    expect { index }.to output("Белова Мия\nГолубева Анна\nАртамонов Никита\nАлексеева Эмилия\n").to_stdout
  end

  it '#find' do
    expect { find(1) }.to output("Голубева Анна\n").to_stdout
  end

  it '#where' do
    expect { where('анна') }.to output("Голубева Анна\n").to_stdout
  end

  it '#update' do
    update(1, 'text')
    expect { index }.to output("Белова Мия\ntext\nАртамонов Никита\nАлексеева Эмилия\n").to_stdout
  end

  it '#delete' do
    delete(1)
    expect { index }.to output("Белова Мия\nАртамонов Никита\nАлексеева Эмилия\n").to_stdout
  end

  # after do
  #   File.delete(FILE) if File.exist?(FILE)
  # end
end
