require_relative '../lib/stack'

describe Stack do
  subject(:stack) { Stack.new }

  describe '#push' do
    it 'allows us to push in objects' do
      stack.push(:plate)
      stack.push("Fortune Cookie")
      stack.push(Time.now)
      stack.push(3.14159)
    end
  end

  describe '#empty?' do
    it 'returns true when empty' do
      expect(stack.empty?).to eq(true)
    end

    it 'returns false when not empty' do
      stack.push("Flying Fish")
      expect(stack.empty?).to eq(false)
    end
  end

  describe '#peek' do
    it 'lets us see the topmost item' do
      stack.push(128)
      expect(stack.peek).to eq(128)
      expect(stack.empty?).to eq(false)
    end
  end

  describe '#pop' do
    it 'removes and returns the topmost item' do
      stack.push(42)
      stack.push(99)
      stack.push(105)
      expect(stack.pop).to eq(105)
    end

    it 'raises an exception if stack is empty' do
      expect { stack.pop }.to raise_error(StackUnderflow)
    end
  end
end
