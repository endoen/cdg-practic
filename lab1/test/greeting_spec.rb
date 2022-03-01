require 'rspec'
require_relative '../greeting'

describe Greeting do
  context '#greeting' do
    it 'should do ok for age > 18' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return('дмитрий', 'прологаев', 21)
      expect do
        Greeting.new.greeting
      end.to_not output('Привет, Дмитрий Прологаев. Самое время заняться делом!').to_stdout
    end

    it 'should do ok for age < 18' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return('дмитрий', 'прологаев', 17)
      expect do
        Greeting.new.greeting
      end.to_not output('Привет, Дмитрий Прологаев.' \
                                 'Тебе меньше 18 лет, но начать учится программировать никогда не рано').to_stdout
    end
  end

  context '#greeting - exception handling' do
    it 'should be ok for empty name input' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return('', '', 17)
      expect { Greeting.new.greeting }.to raise_error(StandardError)
    end

    it 'should be ok for empty name input' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return(' ', ' ', 17)
      expect { Greeting.new.greeting }.to raise_error(StandardError)
    end

    it 'should be ok for negative age input' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return('Дмитрий', 'Прологаев', -1)
      expect { Greeting.new.greeting }.to raise_error(StandardError)
    end
  end
end
