require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:board_games) }

  it { should have_valid(:email).when('someone@somewhere.com') }
  it { should_not have_valid(:email).when(nil, '') }

  it { should have_valid(:role).when('user', 'admin') }
  it { should_not have_valid(:role).when(nil, '', 'god_mode') }
end
