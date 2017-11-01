require 'rails_helper'

RSpec.describe Store, type: :model do
  it { should validate_presence_of(:long_name) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:distance) }
  it { should validate_presence_of(:phone) }
end
