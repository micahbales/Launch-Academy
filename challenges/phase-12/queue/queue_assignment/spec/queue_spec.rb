require_relative '../lib/queue'

describe Launch::Queue do
  subject(:queue) { Launch::Queue.new }

  describe '#enter' do
    it 'allows items to enter the queue' do
      queue.enter('Eric')
      queue.enter('Adam')
      queue.enter('Helen')
      queue.enter('Faizaan')
      queue.enter('Richard')
    end
  end

  describe '#empty?' do
    it 'returns true when empty' do
      expect(queue.empty?).to eq(true)
    end

    it 'returns false when not empty' do
      queue.enter(:sushi_roll)
      expect(queue.empty?).to eq(false)
    end
  end

  describe '#peek' do
    it 'lets us see the item at the front' do
      queue.enter('Mr. G')
      expect(queue.peek).to eq('Mr. G')
      expect(queue.empty?).to eq(false)
    end
  end

  describe '#leave' do
    it 'removes and returns the item at the front' do
      queue.enter(5)
      queue.enter(10)
      queue.enter(15)
      expect(queue.leave).to eq(5)
    end

    it 'raises an exception if the queue is empty' do
      expect { queue.leave }.to raise_error(Launch::QueueIsEmpty)
    end
  end
end
