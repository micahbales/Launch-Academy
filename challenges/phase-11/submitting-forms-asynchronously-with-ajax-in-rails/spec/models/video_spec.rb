require 'rails_helper'

RSpec.describe Video, type: :model do
  it { should belong_to(:format) }
  it { should belong_to(:genre) }
  it { should have_many(:comments) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:format) }
end
