require_relative '../lib/bracket_matcher.rb'

describe BracketMatcher do
  it 'returns true for a matching set of parens' do
    matcher = BracketMatcher.new('()')
    expect(matcher.valid?).to eq(true)
  end

  it 'returns true for a matching set of square brackets' do
    matcher = BracketMatcher.new('[]')
    expect(matcher.valid?).to eq(true)
  end

  it 'returns true for a matching set of curly braces' do
    matcher = BracketMatcher.new('{}')
    expect(matcher.valid?).to eq(true)
  end

  it 'returns false for a non-matching set of brackets' do
    matcher = BracketMatcher.new('(]')
    expect(matcher.valid?).to eq(false)
  end

  it 'returns false when brackets are not ordered correctly' do
    matcher = BracketMatcher.new('([)]')
    expect(matcher.valid?).to eq(false)
  end

  it 'returns true for a complex, matching set of brackets' do
    matcher = BracketMatcher.new('([{([])}])')
    expect(matcher.valid?).to eq(true)
  end

  it 'returns false for a complex, non-matching set of brackets' do
    matcher = BracketMatcher.new('(){}{}{}{}[[[[[]]]))(((]]])(}[)')
    expect(matcher.valid?).to eq(false)
  end
end
