require 'rails_helper'

RSpec.describe College, type: :model do
  before(:each) do
   FactoryBot.create(:college)
  end

  it "exists with valid attributes" do
    college = College.last
    expect(userfirst_name).to eq('Spencer')
    expect(user.last_name).to eq('Romberg')
    expect(user.phone_number).to eq('7205551324')
  end
end
