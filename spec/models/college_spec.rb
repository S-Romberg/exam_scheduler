require 'rails_helper'

RSpec.describe College, type: :model do
  before(:each) do
   FactoryBot.create(:college)
  end

  it "exists with valid attributes" do
    college = College.last
    expect(college.name).to eq('WGU')
  end
end
