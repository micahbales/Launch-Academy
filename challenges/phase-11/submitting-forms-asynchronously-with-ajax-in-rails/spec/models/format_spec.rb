require 'rails_helper'

RSpec.describe Format, type: :model do
  it { should have_many(:videos) }

  subject { Format.new(name: "Format Example") }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
