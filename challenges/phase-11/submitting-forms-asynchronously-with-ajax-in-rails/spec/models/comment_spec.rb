require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:video) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:video) }
end
