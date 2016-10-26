require 'rails_helper'

RSpec.describe Station, type: :model do
  it { should have_valid(:name).when('Benning Road', 'Takoma Park') }
  it { should_not have_valid(:name).when(nil, '') }
end
