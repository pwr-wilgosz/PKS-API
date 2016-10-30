require 'rails_helper'

RSpec.describe Bus, type: :model do
  describe '#validations' do
    it { is_expected.to validate_uniqueness_of(:registration_number) }
    it { is_expected.to validate_presence_of(:registration_number) }
    it { is_expected.to validate_presence_of(:spaces) }
    it { is_expected.to validate_presence_of(:brand) }
  end
end

